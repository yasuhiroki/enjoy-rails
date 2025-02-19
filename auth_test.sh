#/bin/zsh

function get() {
  echo
  local _auth=$(cat auth)
  #echo "Keep: $(echo ${auth} | cut -d' ' -f2 | base64 -d | jq '."access-token"')"
  echo "Use : $(echo ${_auth} | cut -d' ' -f2 | base64 -d | jq '."access-token"')"
  local _res=$(curl 'http://localhost:3010/users.json' \
    -s \
    -H "authorization: $(cat auth)" \
    -w '%{header_json}' \
    | \
    jq -s -r ".[0], .[1].authorization[0]")
  echo $_res > res.txt
  #cat res.txt | tail -n1 > auth
  echo "Res : $(echo ${_res} | tail -n1 | cut -d' ' -f2 | base64 -d | jq '."access-token"')"
    #cat res.txt | tail -n1 > auth
}

function sign_in() {
    curl 'http://localhost:3010/auth/sign_in.json' \
      -X POST \
      -s \
      -H 'Content-Type: application/json' \
      -d @<( jo 'email=yasuhiroki.duck@gmail.com' 'password=CPa9CrgLqN7BE3E') \
      -w '%{header_json}' \
      -o /dev/null
}


echo "/sign_in"
auth=$(sign_in | jq -r ".authorization[0]")
echo "New auth token → ${auth}"
echo
echo "${auth}" > auth

echo "Call GET"

echo "---"
echo "/sign_in で発行されたtokenで認証し続けられる"
get &
get &
get &
get &
get &

wait

sleep 6
echo "---"
echo "'DeviseTokenAuth.batch_request_buffer_throttle'秒経ったのでtokenが更新されるが previous_token なので認証可能"

get &
get &
get &

wait

exit 0

sleep 6
echo "---"
echo "'DeviseTokenAuth.batch_request_buffer_throttle'秒経ったのでtokenが更新されるが last_token なので認証可能"

get
get

sleep 6
echo "---"
echo "'DeviseTokenAuth.batch_request_buffer_throttle'秒経ったので認証エラーになる"

get
get

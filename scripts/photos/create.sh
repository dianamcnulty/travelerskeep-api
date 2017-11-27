# curl -v http://localhost:4741/photos \
#   -H 'Content-Type: multipart/form-data' \
#   -H 'Accept: application/json' \
#   -F "photo[caption]=awesomeimagetitle" \
#   -F "photo[img]='../../documentation/ERD-travelers-keep.png';type=image/png"
#

  API="${API_ORIGIN:-http://localhost:4741}"
  URL_PATH="/photos"
  curl "${API}${URL_PATH}" \
    --include \
    --request POST \
    --header "Content-Type: multipart/form-data" \
    --header "Authorization: Token token=$TOKEN" \
    --header "Accept: application/json"
    --data '{
      "photo": {
        "caption": "'"ThePhotoCaption!!"'",
        "img": "'"'../../documentation/ERD-travelers-keep.png';type=image/png"'",
        "vacation_id":"'"2"'"
      }
    }'

  echo

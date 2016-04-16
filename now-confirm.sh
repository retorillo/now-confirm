function now() {
  skip=0
  for i in "$@"; do 
    case "$i" in
      "--login") skip=1 ;;
      "-L") skip=1 ;;
      "--help" ) skip=1 ;;
      "-h" ) skip=1 ;;
      "--version" ) skip=1 ;;
      "-v" ) skip=1 ;;
    esac
  done
  if [ $skip -ne 1 ]; then
    echo -e "\e[31mType \e[1m$(basename $(pwd))\e[01m to confirm\e[0m"
    read -e ans >> /dev/null
  fi
  if [ $skip -eq 1 -o "$ans" == "$(basename $(pwd))" ]; then
    $(which now) "$@"
  fi
}

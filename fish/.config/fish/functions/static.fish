function static --description "Start a HTTP static server"
  if count $argv > /dev/null
    ruby -run -e httpd -- $argv
  else
    echo "Usage: static [PATH] -p 80 --bind-address=0.0.0.0"
  end
end

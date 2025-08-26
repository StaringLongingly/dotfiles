function openspeedtest --wraps='sudo docker run --name openspeedtest -d -p 3000:3000 -p 3001:3001 openspeedtest/latest' --description 'alias openspeedtest sudo docker run --name openspeedtest -d -p 3000:3000 -p 3001:3001 openspeedtest/latest'
  sudo docker run --name openspeedtest -d -p 3000:3000 -p 3001:3001 openspeedtest/latest $argv
        
end

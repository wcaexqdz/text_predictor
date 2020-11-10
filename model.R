# load data
dir = 'C:/Users/wcaexqdz/Documents/textPredictor/'
dir = ''
bigrams = read.csv(paste(dir,'bigrams.csv',sep=''))
trigrams = read.csv(paste(dir,'trigrams.csv',sep=''))
fourgrams = read.csv(paste(dir,'fourgrams.csv',sep=''))
fivegrams = read.csv(paste(dir,'fivegrams.csv',sep=''))

matchb = function(s){
  temp = subset(bigrams, w1 == s, select = w0)
  
  if (nrow(temp) == 0){return('I don\'t know!')}
  if (nrow(temp) > 10){return(sample(temp[1:10,],1))}
  return(sample(temp[1:nrow(temp),],1))
}

matcht = function(s){
  temp = subset(trigrams, w2 == s[1])
  temp = subset(temp, w1 == s[2], select = w0)
  
  if (nrow(temp) == 0){return(matchb(s[2]))}
  if (nrow(temp) > 10){return(sample(temp[1:10,],1))}
  return(sample(temp[1:nrow(temp),],1))
}

match4 = function(s){
  temp = subset(fourgrams, w3 == s[1])
  temp = subset(temp, w2 == s[2])
  temp = subset(temp, w1 == s[3], select = w0)
  
  if (nrow(temp) == 0){return(matcht(s[2:3]))}
  if (nrow(temp) > 10){return(sample(temp[1:10,],1))}
  return(sample(temp[1:nrow(temp),],1))
}

match5 = function(s){
  temp = subset(fivegrams, w4 == s[1])
  temp = subset(temp, w3 == s[2])
  temp = subset(temp, w2 == s[3])
  temp = subset(temp, w1 == s[4], select = w0)
  
  if (nrow(temp) == 0){return(match4(s[2:4]))}
  if (nrow(temp) > 10){return(sample(temp[1:10,],1))}
  return(sample(temp[1:nrow(temp),],1))
}

pred = function(s){
  words = strsplit(s, ' ')
  words = words[[1]]
  
  if (length(words) == 0){return('<-- Type something there')}
  if (length(words) == 1){return(matchb(words))}
  if (length(words) == 2){return(matcht(words))}
  if (length(words) == 3){return(match4(words))}
  return(match5(words[(length(words)-3):length(words)]))
}

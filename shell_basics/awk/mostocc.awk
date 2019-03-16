#!/usr/bin/awk -f
BEGIN{
FS=" "
}
{
	for(i=0;i<NF;i++)
		arr[$i]++
}
END{
	for (word in arr)
	 printf("%s is %d\n",word,arr[word])
}

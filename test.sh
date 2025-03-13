ls
ls -la
echo "haha"
cd func && cc main.c
if ./a.out | grep "ERROR"; then
	printf " Error\n"
else
	printf "\tAll OK!\n"
fi
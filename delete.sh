git submodule foreach git pull origin main
make fclean
(cd libft && ls | grep -v srcs | grep -v includes | xargs rm -rf)
(cd libdclist && ls | grep -v srcs | grep -v includes | xargs rm -rf)
(cd libgnl && ls | grep -v srcs | grep -v includes | xargs rm -rf)
rm -rf */.github

# # git
# rm -rf */.gitmodules
# rm -rf */.git
# rm .gitmodules
# rm -rf .git

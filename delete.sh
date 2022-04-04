git submodule foreach git pull origin main
make fclean
(cd libft && ls | grep -v srcs | grep -v includes | grep -v Makefile | xargs rm -rf)
(cd libdclist && ls | grep -v srcs | grep -v includes | grep -v Makefile | xargs rm -rf)

# # git
# rm -rf */.github
# rm -rf */.gitmodules
# rm -rf */.git
# rm .gitmodules
# rm -rf .git

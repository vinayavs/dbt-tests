import json
import subprocess as sp 
cmd="aws iam list-users --no-paginate"
out_err=sp.Popen(cmd, shell=True, stdout=sp.PIPE, stderr=sp.PIPE)
rt=out_err.wait()
out,err=out_err.communicate()
print(json.loads(out))
print("***********")
print(err)
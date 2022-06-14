import os,io
cur_path = os.getcwd() #should be the src/main/resources
with io.open(cur_path+"/tempfile", mode='w') as the_file:
    the_file.write(u'hello maven')
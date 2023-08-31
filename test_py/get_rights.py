import xml.etree.ElementTree as ET
import subprocess

# 解析XML文件
# tree = ET.parse('/home/user/Downloads/x9u manifest.xml')
def get_rights(path,file_str):
    tree = ET.parse(path)
    # tree = ET.parse('/home/user/manifest.xml')
    root = tree.getroot()

    # 获取所有project name字段的值
    project_names = [project.attrib['name'] for project in root.findall('project')]

    # 遍历project names并检查权限
    for project_name in project_names:
        # 构建git ls-remote命令
        command = f'git ls-remote --exit-code --heads ssh://jing.jiang@shaitgrt01:29418/{project_name}'

        # 执行命令并获取输出
        output = subprocess.run(command, shell=True, capture_output=True, text=True)

        # 检查命令执行结果
        if output.returncode == 0:
            print(f"仓库 {project_name} 存在")
            with open(file_str+'_success.txt', 'a') as f:
                f.write(project_name + '\n')
        else:
            print(f"仓库 {project_name} 不存在")
            # print(output.stderr)
            # 将项目名称写入fail.txt文件
            with open(file_str+'_fail.txt', 'a') as f:
                f.write(project_name + '\n')

get_rights('/home/user/Downloads/x9u manifest.xml','x9')
get_rights('/home/user/manifest.xml','j2')

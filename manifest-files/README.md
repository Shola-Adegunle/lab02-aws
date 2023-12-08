1) Create Architectural Diagram
2) Create admin service account(s) 


Terraform
1) main.tf
2) networking.tf
    vcp
    subnet(s)
3) instances.tf
    create ec2 key pair in aws
    security group(s)
    web instances
    use datasource image 
4) 


ADO
1) Setup service account in ADO
    a) use access key
2) Create build pipeline folders
    a) use ADO repo for deployments so set this as the origin
    b) create build pipeline (ensure this is in the folder)
        1. correct pipeline trigger
        2. TestAgentPool
        3. copy files
        4. publish artifact
3) Create release pipeline

# test
# export JWT_SECRET='hawaii'
# export LOG_LEVEL=DEBUG

# python main.py

# # docker
# export TOKEN=`curl -d '{"email":"cc@gmail.com","password":"abc123"}' -H "Content-Type: application/json" -X POST localhost:8080/auth  | jq -r '.token'`
# # echo $TOKEN
# curl --request GET 'http://127.0.0.1:8080/contents' -H "Authorization: Bearer ${TOKEN}" | jq .

# docker build -t "jwt-api-test" .
# docker run --rm --env-file=.env_file -p 8080:8080 jwt-api-test

# hm
# create eks
eksctl create cluster --name simple-jwt-api

# Create JWT secret variable
aws ssm put-parameter --name JWT_SECRET --value "hawaii" --type SecureString

# setup role
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
TRUST="{ \"Version\": \"2012-10-17\", \"Statement\": [ { \"Effect\": \"Allow\",  \"Principal\": { \"AWS\": \"arn:aws:iam::${ACCOUNT_ID}:root\" }, \"Action\":  \"sts:AssumeRole\" } ] }"
aws iam create-role --role-name UdacityFlaskDeployCBKubectlRole --assume-role-policy-document "$TRUST" --output text --query 'Role.Arn'
echo '{ "Version": "2012-10-17", "Statement": [ { "Effect": "Allow", "Action": [ "eks:Describe*", "ssm:GetParameters" ], "Resource": "*" } ] }' > ./iam-role-policy
aws iam put-role-policy --role-name UdacityFlaskDeployCBKubectlRole --policy-name eks-describe --policy-document file://./iam-role-policy

kubectl get -n kube-system configmap/aws-auth -o yaml > ./aws-auth-patch.yml


export TOKEN=`curl -d '{"email":"yingcai202012@gmail.com","password":"webshots4047A"}' -H "Content-Type: application/json" -X POST a49fc73d9cc9f445eb17cb7b98b1659b-820285517.us-west-2.elb.amazonaws.com/auth  | jq -r '.token'`
curl --request GET 'a49fc73d9cc9f445eb17cb7b98b1659b-820285517.us-west-2.elb.amazonaws.com/contents' -H "Authorization: Bearer ${TOKEN}" | jq 

# curl --request GET 'a49fc73d9cc9f445eb17cb7b98b1659b-820285517.us-west-2.elb.amazonaws.com'
# return = 'healthy'
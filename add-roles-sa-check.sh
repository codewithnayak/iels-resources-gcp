#¡/bin/bash
## Change your project id , if needed
## TODO: Parameterized script execution
project="keen-ally-438611-t7"
sa="terraform-default-svc-account@keen-ally-438611-t7.iam.gserviceaccount.com"
role="roles/compute.admin"
set -e

gcloud config set project $project

gcloud projects add-iam-policy-binding $project \
    --member="serviceAccount:terraform-default-svc-account@keen-ally-438611-t7.iam.gserviceaccount.com" \
    --role="roles/compute.admin"

##Check assigned roles
echo "*** Check assigned roles $project $sa ***"
gcloud projects get-iam-policy $project \
    --flatten="bindings[].members" \
    --format="table(bindings.role)" \
    --filter="bindings.members:serviceAccount:terraform-default-svc-account@keen-ally-438611-t7.iam.gserviceaccount.com"

#¡/bin/bash
## Change your project id , if needed
## TODO: Parameterized script execution
project="primeval-nectar-431120-j5"
sa="terraform-service-account@primeval-nectar-431120-j5.iam.gserviceaccount.com"
role="roles/compute.securityAdmin"
set -e

gcloud config set project $project

gcloud projects add-iam-policy-binding $project \
    --member="serviceAccount:terraform-service-account@primeval-nectar-431120-j5.iam.gserviceaccount.com" \
    --role="roles/compute.securityAdmin"

##Check assigned roles
echo "*** Check assigned roles $project $sa ***"
gcloud projects get-iam-policy $project \
    --flatten="bindings[].members" \
    --format="table(bindings.role)" \
    --filter="bindings.members:serviceAccount:terraform-service-account@primeval-nectar-431120-j5.iam.gserviceaccount.com"

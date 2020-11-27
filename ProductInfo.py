import json
def getInfo(P_details_list):
    P_details_dict=dict()
    P_details_dict['id']= P_details_list[0]
    P_details_dict['title']=P_details_list[1]
    P_details_dict['price']=P_details_list[2]
    P_details_dict['description']=P_details_list[3]
    P_details_dict['category']=P_details_list[4]
    P_details_dict['img_string']=P_details_list[5]
    return P_details_dict

if __name__ == "__main__":
    P_details=input('enter the id,title,price,description,category,size,color')
    P_details_list=P_details.split(' ')
    P_details_dict=getInfo(P_details_list)
    P_list=list()
    P_list.append(P_details_dict)
    P_details=input('enter the id,title,price,description,category,size,color')
    P_details_list=P_details.split(' ')
    P_details_dict=getInfo(P_details_list)
    P_list.append(P_details_dict)
    x=json.dumps(P_list)
    info=open('assets/info/info.txt','a')
    info.write(x)
    info.close()
    
    
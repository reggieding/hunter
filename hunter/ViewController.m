//
//  ViewController.m
//  hunter
//
//  Created by Reggie on 15/5/27.
//  Copyright (c) 2015年 Reggie. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [MBProgressHUD showError:@"hello"];
    
    //用户登录

    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    NSString* url = [NSString stringWithFormat:@"%@/user/login.json",SERVERURL];
    url = [url stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"15306552165",@"userName",@"123456",@"password",nil];
    //NSString * string =@"{\"userName\":\"15306552165\",\"password\":\"123456\"}";
    
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    
    [manager POST:url parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {//登录成功后，操作需要带token
        //3.12	获取收藏列表
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@1,@"start",@5,@"limit",nil];
        
        //申明返回的结果是json类型
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        //申明请求的数据是json类型
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        
        NSString * accessToken = [responseObject objectForKey:@"accessToken"];
        
        [manager.requestSerializer setValue:accessToken forHTTPHeaderField:@"accessToken"];
        
        NSString *url1 = [NSString stringWithFormat:@"%@/favorite/listFavorites.json",SERVERURL];
        url1 = [url1 stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
        
        [manager POST:url1 parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"successful %@",responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"unsuccessful %@",error);
        }];
        
        //3.11	收藏他人的分享
        /*
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"1e37407f25f24139a62ed96772528f8f",@"shareId",@1,@"isFavorite",nil];
        
        //申明返回的结果是json类型
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        //申明请求的数据是json类型
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        
        NSString * accessToken = [responseObject objectForKey:@"accessToken"];
        
        [manager.requestSerializer setValue:accessToken forHTTPHeaderField:@"accessToken"];
        
        NSString *url1 = [NSString stringWithFormat:@"%@/favorite/OnOrOffFavorite.json",SERVERURL];
        url1 = [url1 stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
        
        [manager POST:url1 parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"successful %@",responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"unsuccessful %@",error);
        }];
        */
        
        //3.10	获取分享的评论
        /*
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"1e37407f25f24139a62ed96772528f8f",@"shareId",nil];
        
        //申明返回的结果是json类型
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        //申明请求的数据是json类型
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        
        NSString * accessToken = [responseObject objectForKey:@"accessToken"];
        
        [manager.requestSerializer setValue:accessToken forHTTPHeaderField:@"accessToken"];
        
        NSString *url1 = [NSString stringWithFormat:@"%@/comment/listComments.json",SERVERURL];
        url1 = [url1 stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
        
        [manager POST:url1 parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"successful %@",responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"unsuccessful %@",error);
        }];
    */
        
        //3.9	对分享进行评论
        /*
        NSString *userId = [responseObject valueForKeyPath:@"data.userId"];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"1e37407f25f24139a62ed96772528f8f",@"shareId",@"hello-repeat",@"content",userId,@"userId",userId,@"toUserId",@"bba450872896422d88d55017352b4202",@"parentCommentId",nil];
        
        //申明返回的结果是json类型
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        //申明请求的数据是json类型
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        
        NSString * accessToken = [responseObject objectForKey:@"accessToken"];
        
        [manager.requestSerializer setValue:accessToken forHTTPHeaderField:@"accessToken"];
        
        NSString *url1 = [NSString stringWithFormat:@"%@/comment/addComment.json",SERVERURL];
        url1 = [url1 stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
        
        [manager POST:url1 parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"successful %@",responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"unsuccessful %@",error);
        }];
        */
        
        //3.8	分享里边的附件下载
        /*
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"1a6e8aea0c54411884db848f61a93140",@"attachmentId",nil];
        
        //申明返回的结果是json类型
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        //申明请求的数据是json类型
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        
        //manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",@"image/png",@"image/jpeg", nil];
        
        NSString * accessToken = [responseObject objectForKey:@"accessToken"];
        
        [manager.requestSerializer setValue:accessToken forHTTPHeaderField:@"accessToken"];
        
        NSString *url1 = [NSString stringWithFormat:@"%@/attachment/download",SERVERURL];
        url1 = [url1 stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
        
        [manager POST:url1 parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"successful %@",responseObject);
            NSData *imageData = responseObject;
            //UIImage *image = [UIImage imageWithData:responseObject];
            NSString *pngPath = @"/Users/Reggie/Desktop/1.png";
            //[UIImagePNGRepresentation(image) writeToFile:pngPath atomically:YES];
            [imageData writeToFile:pngPath atomically:YES];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"unsuccessful %@",error);
        }];
        */
       
        
        //3.7	根据当前用户位置获取附近的分享
        /*
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@1,@"start",@10,@"limit",@123,@"longitude",0,@"latitude",@100,@"distance",nil];
        
        //申明返回的结果是json类型
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        //申明请求的数据是json类型
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        
        NSString * accessToken = [responseObject objectForKey:@"accessToken"];
        
        [manager.requestSerializer setValue:accessToken forHTTPHeaderField:@"accessToken"];
        
        NSString *url1 = [NSString stringWithFormat:@"%@/share/getShareByDistance.json",SERVERURL];
        url1 = [url1 stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
        
        [manager POST:url1 parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"successful %@",responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"unsuccessful %@",error);
        }];
        */
        
        //3.7 获取他人或者自己的分享
        /*
        NSString *userId = [responseObject valueForKeyPath:@"data.userId"];
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:userId,@"userId",@1,@"start",@10,@"limit",nil];
        
        //申明返回的结果是json类型
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        //申明请求的数据是json类型
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        
        NSString * accessToken = [responseObject objectForKey:@"accessToken"];
        
        [manager.requestSerializer setValue:accessToken forHTTPHeaderField:@"accessToken"];
        
        NSString *url1 = [NSString stringWithFormat:@"%@/share/listShare.json",SERVERURL];
        url1 = [url1 stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
        
        [manager POST:url1 parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"successful %@",responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"unsuccessful %@",error);
        }];
        
        //3.6 分享视图
        /*
        AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
        NSString* url = [NSString stringWithFormat:@"%@/share/addShare.json",SERVERURL];
        url = [url stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];

        UIImage *image = [UIImage imageNamed:@"ad02-1.png"];
        NSData * imageData = UIImageJPEGRepresentation(image, 0.5);
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@1,@"shareType",@"",@"description",@"",@"address",@123,@"latitude",@1,@"actionType",nil];
        
        //申明返回的结果是json类型
        manager.responseSerializer = [AFJSONResponseSerializer serializer];

        //申明请求的数据是json类型
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/plain",@"application/json", nil];
        
        //设置http head数据
        NSString * accessToken = [responseObject objectForKey:@"accessToken"];
        [manager.requestSerializer setValue:accessToken forHTTPHeaderField:@"accessToken"];
        
         //name 字段名字
         //fileName 图片文件名
        [manager POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            [formData appendPartWithFileData:imageData name:@"uploadFiles" fileName:@"ad02-1.png" mimeType:@"image/png"];
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"successful %@",responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"unsuccessful %@",error);
        }];
        */
        /////////更新用户信息///////////
        /*
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"dyy@163.com",@"email",nil];
        
        //申明返回的结果是json类型
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        //申明请求的数据是json类型
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        
        NSString * accessToken = [responseObject objectForKey:@"accessToken"];
        
        [manager.requestSerializer setValue:accessToken forHTTPHeaderField:@"accessToken"];

        NSString *url1 = [NSString stringWithFormat:@"%@/user/updateUserInfo.json",SERVERURL];
        url1 = [url1 stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
        
        [manager POST:url1 parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"successful %@",responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"unsuccessful %@",error);
        }];*/
        NSLog(@"successful");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"unsuccessful");
    }];
    
    
    /*
     用户注册
     AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
     NSString* url = [NSString stringWithFormat:@"%@/user/register.json",SERVERURL];
     url = [url stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
     
     NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"15306552166",@"userName",@"123456",@"password",nil];
     //NSString * string =@"{\"userName\":\"15306552165\",\"password\":\"123456\"}";
     
     //申明返回的结果是json类型
     manager.responseSerializer = [AFJSONResponseSerializer serializer];
     
     //申明请求的数据是json类型
     manager.requestSerializer=[AFJSONRequestSerializer serializer];
     
     [manager POST:url parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
     NSLog(@"successful");
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
     NSLog(@"unsuccessful");
     }];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



//http://60.191.101.58/zxqy/pda_dispatch/pda_index.action?req={"service":"loginService","method":"pda_login","args":{"loginname":"15306552165","passwd":"123456”}}

//http://120.25.124.177/miniwingApi/api/user/register.json




//NSString * string =@"{\“userName\":\"15306552165\",\"password\":\"123456\",\"email\":\"dyy@163.com","sex":0,"age":21}";"


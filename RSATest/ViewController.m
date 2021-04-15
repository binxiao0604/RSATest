//
//  ViewController.m
//  RSATest
//
//  Created by ZP on 2021/4/15.
//

#import "ViewController.h"
#import "HPRSACryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载公钥
    [[HPRSACryptor sharedRSACryptor] loadPublicKey:[[NSBundle mainBundle] pathForResource:@"rsacert" ofType:@"der"]];
    
    //加载私钥
    [[HPRSACryptor sharedRSACryptor] loadPrivateKey:[[NSBundle mainBundle] pathForResource:@"p" ofType:@"p12"] password:@"123456"];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //加密
    NSData *encryptData = [[HPRSACryptor sharedRSACryptor] encryptData:[@"HotpotCat" dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *encryptBase64Message = [encryptData base64EncodedStringWithOptions:0];
    NSLog(@"rsa encrypt base64:%@",encryptBase64Message);
    
    //解密
    NSData *decryptData = [[HPRSACryptor sharedRSACryptor] decryptData:encryptData];
    NSString *decryptStr = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
    NSLog(@"rsa decrypt message:%@",decryptStr);
}



@end

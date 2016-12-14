//
//  ViewController.h
//  CoreDataTry
//
//  Created by devil1001 on 14.12.16.
//  Copyright © 2016 devil1001. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController

@property (weak, nonatomic)IBOutlet UITextField *nameText;
@property (weak, nonatomic)IBOutlet UITextField *versionText;
@property (weak, nonatomic)IBOutlet UITextField *companyText;
@property (strong)NSManagedObject *device;

-(IBAction)cancel:(id)sender;
-(IBAction)save:(id)sender;

@end


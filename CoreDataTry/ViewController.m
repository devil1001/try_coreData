//
//  ViewController.m
//  CoreDataTry
//
//  Created by devil1001 on 14.12.16.
//  Copyright © 2016 devil1001. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize nameText, versionText, companyText, device;

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self managedObjectContext];
    // Do any additional setup after loading the view, typically from a nib.
    if (self.device) {
        [nameText setText:[self.device valueForKey:@"name"]];
        [versionText setText:[self.device valueForKey:@"version"]];
        [companyText setText:[self.device valueForKey:@"company"]];
    }
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
    self = [super initWithNibName:nibName bundle:nibBundle];
    if (self) {
        
    }
    return self;
}


-(IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    if (self.device) {
        [self.device setValue:self.nameText.text forKey:@"name"];
        [self.device setValue:self.versionText.text forKey:@"version"];
        [self.device setValue:self.companyText.text forKey:@"company"];
    } else {
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
        [newDevice setValue:self.nameText.text forKey:@"name"];
        [newDevice setValue:self.versionText.text forKey:@"version"];
        [newDevice setValue:self.companyText.text forKey:@"company"];
    }
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't save %@ %@", error, [error localizedDescription]);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

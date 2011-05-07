//
//  ASTRootViewController.m
//  ASTStore
//
//  Created by Greg Meach on 5/6/11.
//  http://www.meachware.com

//  Copyright (c) 2011 Meachware
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "ASTRootViewController.h"
#import "ASTStoreViewController.h"

@implementation ASTRootViewController

- (IBAction)showASTStoreBtnPressed:(id)sender
{
    if (isAniPad) {
        ASTStoreViewController *vc = [[ASTStoreViewController alloc] initWithNibName:@"ASTStoreViewController-iPad" bundle:nil];
        vc.delegate = self;
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
        navController.modalPresentationStyle = UIModalPresentationFormSheet; //Like 1/2 the size
        [self presentModalViewController:navController animated:YES];
        [navController release];
        [vc release];
	} else {
        ASTStoreViewController *vc = [[ASTStoreViewController alloc] initWithNibName:@"ASTStoreViewController" bundle:nil];
        vc.delegate = self;
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
        [self presentModalViewController:navController animated:YES];
        [navController release];
        [vc release];
	}    

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)astStoreViewControllerDidFinish:(ASTStoreViewController *)controller
{
    
    [self dismissModalViewControllerAnimated:YES];
    NSLog(@"ASTStoreViewController didDismiss");
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    isAniPad = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
    //(interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
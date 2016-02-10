//
//  AcronymResultTableViewCell.h
//  AcronymsSearch
//
//  Created by Venkata Dheeraj Palur on 2/9/16.
//  Copyright © 2016 Venkata Dheeraj Palur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AcronymResultTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *fullFormLabel;
@property (weak, nonatomic) IBOutlet UILabel *sinceLabel;
@property (weak, nonatomic) IBOutlet UILabel *frequencyLabel;

@end

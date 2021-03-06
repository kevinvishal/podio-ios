//
//  PKItemFieldValueOptionData.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 8/23/11.
//  Copyright (c) 2012 Citrix Systems, Inc. All rights reserved.
//

#import "PKItemFieldValueOptionData.h"


static NSString * const PKItemFieldValueOptionDataAnswerIdKey = @"AnswerId";
static NSString * const PKItemFieldValueOptionDataAnswerKey = @"Answer";
static NSString * const PKItemFieldValueOptionDataSelectedKey = @"Selected";
static NSString * const PKItemFieldValueOptionDataColorStringKey = @"ColorString";

@implementation PKItemFieldValueOptionData

@synthesize optionId = optionId_;
@synthesize text = text_;
@synthesize selected = selected_;
@synthesize colorString = colorString_;

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    optionId_ = [aDecoder decodeIntegerForKey:PKItemFieldValueOptionDataAnswerIdKey];
    text_ = [[aDecoder decodeObjectForKey:PKItemFieldValueOptionDataAnswerKey] copy];
    selected_ = [aDecoder decodeBoolForKey:PKItemFieldValueOptionDataSelectedKey];
    colorString_ = [[aDecoder decodeObjectForKey:PKItemFieldValueOptionDataColorStringKey] copy];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [super encodeWithCoder:aCoder];
  [aCoder encodeInteger:optionId_ forKey:PKItemFieldValueOptionDataAnswerIdKey];
  [aCoder encodeObject:text_ forKey:PKItemFieldValueOptionDataAnswerKey];
  [aCoder encodeBool:selected_ forKey:PKItemFieldValueOptionDataSelectedKey];
  [aCoder encodeObject:colorString_ forKey:PKItemFieldValueOptionDataColorStringKey];
}


- (BOOL)isEqual:(id)object {
  BOOL equal = NO;
  if (![object isKindOfClass:[self class]]) {
    return equal;
  }
  
  return [self isEqualToOption:(PKItemFieldValueOptionData *)object];
}

- (BOOL)isEqualToOption:(PKItemFieldValueOptionData *)option {
  BOOL equal;
  
  if (self.optionId > 0) {
    // Compare ids
    equal = self.optionId == [option optionId];
  } else {
    // Compare strings
    equal = [self.text isEqualToString:[option text]];
  }
  
  return equal;
}

- (NSUInteger)hash {
  return [@(self.optionId) hash];
}


- (NSString *)description {
  // Print as dictionary
  return [@{@"optionId": @(optionId_), 
           @"text": text_, 
           @"selected": @(selected_)} description];
}

#pragma mark - Factory methods

+ (id)dataFromDictionary:(NSDictionary *)dict {
  PKItemFieldValueOptionData *data = [PKItemFieldValueOptionData data];
  
  data.optionId = [[dict pk_objectForKey:@"id"] integerValue];
  data.text = [dict pk_objectForKey:@"text"];
  data.selected = NO;
  data.colorString = [dict pk_objectForKey:@"color"];
  
  return data;
}

@end

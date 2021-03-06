//
//  PKTestMappingProvider.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 12/21/11.
//  Copyright (c) 2012 Citrix Systems, Inc. All rights reserved.
//

#import "PKTestMappingProvider.h"

@implementation PKTestMappingProvider

- (void)buildClassMap {
  [self addMappedClassName:@"PKTestItem" forMappingClassName:@"PKTestItemMapping"];
  [self addMappedClassName:@"PKTestItemField" forMappingClassName:@"PKTestItemFieldMapping"];
  [self addMappedClassName:@"PKTestItemApp" forMappingClassName:@"PKTestItemAppMapping"];
  
  [self addMappedClassName:@"PKTestTask" forMappingClassName:@"PKTestTaskMapping"];
}

@end

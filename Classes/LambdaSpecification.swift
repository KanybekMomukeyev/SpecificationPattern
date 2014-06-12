//
// LambdaSpecification
//
// Created by Simon Strandgaard on 04/06/14.
// Copyright (c) 2014 Simon Strandgaard. All rights reserved.
// MIT license.
//

import Foundation

class LambdaSpecification<T>: CompositeSpecification {
	let lambda: T -> Bool
	
	init(lambda: T -> Bool) {
		self.lambda = lambda
		super.init()
	}
	
	class func lambda(lambda: T -> Bool) -> LambdaSpecification {
		return LambdaSpecification(lambda)
	}
	
	override func isSatisfiedBy(candidate: Any) -> Bool {
		if !(candidate is T) {
			return false
		}
		if let obj = candidate as? T {
			return lambda(obj)
		}
		return false
	}
}

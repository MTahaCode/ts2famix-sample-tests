Class {
	#name : 'ClassesTest',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'Famix-TypeScript-Importer-Tests',
	#package : 'Famix-TypeScript-Importer-Tests'
}

{ #category : 'running' }
ClassesTest >> setUp [ 
	| file |
	super setUp.
	
	file := 'D:\Projects\ts2famix-sample-tests\JSONModels\model.json' asFileReference.
	
	self assert: file exists description: 'The Json file is missing'.
	
	file readStreamDo: [ :stream |
		model := FamixTypeScriptModel new importFromJSONStream: stream
	]
]

{ #category : 'tests' }
ClassesTest >> testModelHasClasses [
	| classes |
	classes := model allWithSubTypesOf: FamixTypeScriptClass.
	
	self assert: classes size equals: 9.
	
	self assert: (classes anySatisfy: [ :each | each name = 'Repository' ]).
	self assert: (classes anySatisfy: [ :each | each name = 'User' ]).
	self assert: (classes anySatisfy: [ :each | each name = 'Animal' ]).
	self assert: (classes anySatisfy: [ :each | each name = 'Dog' ]).
	self assert: (classes anySatisfy: [ :each | each name = 'Cat' ]).
	self assert: (classes anySatisfy: [ :each | each name = 'Circle' ]).
	self assert: (classes anySatisfy: [ :each | each name = 'Rectangle' ]).
	self assert: (classes anySatisfy: [ :each | each name = 'Service' ]).
	self assert: (classes anySatisfy: [ :each | each name = 'Container' ]).
]

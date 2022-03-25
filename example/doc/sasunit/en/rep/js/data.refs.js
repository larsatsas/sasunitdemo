var allGraphs = [
{ "id"     :  "assertexternal"
,   "called" :
{ "name": "assertexternal"
, "children": [
{ "name": "assertexternal_example_test"
},
{ "name": "comparison_test"
}
]
}
, "caller" :
{ "name": "assertexternal"
, "children": [
{ "name": "_asserts"
},
{ "name": "_checkcallingsequence"
},
{ "name": "_handleerror"
},
{ "name": "_xcmdwithpath"
},
{ "name": "endtestcall"
, "children": [
{ "name": "_delfile"
}
]
}
]
}
} // assertexternal
,
{ "id"     :  "assertImage"
,   "called" :
{ "name": "assertImage"
, "children": [
{ "name": "assertimage_example_test"
},
{ "name": "comparison_test"
}
]
}
, "caller" :
{ "name": "assertImage"
, "children": [
{ "name": "_asserts"
},
{ "name": "_checkcallingsequence"
},
{ "name": "_copyfile"
},
{ "name": "_createtestsubfolder"
, "children": [
{ "name": "_gettestsubfolder"
, "children": [
{ "name": "_abspath"
},
{ "name": "_existdir"
}
]
},
{ "name": "_mkdir"
}
]
},
{ "name": "_getscenariotestid"
},
{ "name": "_handleerror"
},
{ "name": "_xcmdwithpath"
},
{ "name": "endtestcall"
, "children": [
{ "name": "_delfile"
}
]
}
]
}
} // assertImage
,
{ "id"     :  "asserttext"
,   "called" :
{ "name": "asserttext"
, "children": [
{ "name": "asserttext_example_test"
},
{ "name": "comparison_test"
}
]
}
, "caller" :
{ "name": "asserttext"
, "children": [
{ "name": "_asserts"
},
{ "name": "_checkcallingsequence"
},
{ "name": "_copyfile"
},
{ "name": "_createtestsubfolder"
, "children": [
{ "name": "_gettestsubfolder"
, "children": [
{ "name": "_abspath"
},
{ "name": "_existdir"
}
]
},
{ "name": "_mkdir"
}
]
},
{ "name": "_getscenariotestid"
},
{ "name": "_handleerror"
},
{ "name": "_xcmdwithpath"
},
{ "name": "endtestcall"
, "children": [
{ "name": "_delfile"
}
]
}
]
}
} // asserttext
,
{ "id"     :  "basedatasets"
,   "called" :
{ "name": "basedatasets"
, "children": [
{ "name": "database_test"
}
]
}
, "caller" :
{ "name": "basedatasets"
}
} // basedatasets
,
{ "id"     :  "boxplot"
,   "called" :
{ "name": "boxplot"
, "children": [
{ "name": "boxplot_test"
}
]
}
, "caller" :
{ "name": "boxplot"
}
} // boxplot
,
{ "id"     :  "combineddataset"
,   "called" :
{ "name": "combineddataset"
, "children": [
{ "name": "database_test"
}
]
}
, "caller" :
{ "name": "combineddataset"
}
} // combineddataset
,
{ "id"     :  "comparison"
,   "called" :
{ "name": "comparison"
, "children": [
{ "name": "comparison_test"
}
]
}
, "caller" :
{ "name": "comparison"
}
} // comparison
,
{ "id"     :  "CrossReferenceTest1"
,   "called" :
{ "name": "CrossReferenceTest1"
, "children": [
{ "name": "crossreference_test"
}
]
}
, "caller" :
{ "name": "CrossReferenceTest1"
, "children": [
{ "name": "crossreferencetest2"
, "children": [
{ "name": "crossreferencetest3"
, "children": [
{ "name": "crossreferencetest4"
}
]
},
{ "name": "crossreferencetest4"
}
]
},
{ "name": "crossreferencetest4"
}
]
}
} // CrossReferenceTest1
,
{ "id"     :  "CrossReferenceTest2"
,   "called" :
{ "name": "CrossReferenceTest2"
, "children": [
{ "name": "crossreference_test"
},
{ "name": "crossreferencetest1"
, "children": [
{ "name": "crossreference_test"
}
]
}
]
}
, "caller" :
{ "name": "CrossReferenceTest2"
, "children": [
{ "name": "crossreferencetest3"
, "children": [
{ "name": "crossreferencetest4"
}
]
},
{ "name": "crossreferencetest4"
}
]
}
} // CrossReferenceTest2
,
{ "id"     :  "CrossReferenceTest3"
,   "called" :
{ "name": "CrossReferenceTest3"
, "children": [
{ "name": "crossreference_test"
},
{ "name": "crossreferencetest2"
, "children": [
{ "name": "crossreference_test"
},
{ "name": "crossreferencetest1"
, "children": [
{ "name": "crossreference_test"
}
]
}
]
}
]
}
, "caller" :
{ "name": "CrossReferenceTest3"
, "children": [
{ "name": "crossreferencetest4"
}
]
}
} // CrossReferenceTest3
,
{ "id"     :  "CrossReferenceTest4"
,   "called" :
{ "name": "CrossReferenceTest4"
, "children": [
{ "name": "crossreference_test"
},
{ "name": "crossreferencetest1"
, "children": [
{ "name": "crossreference_test"
}
]
},
{ "name": "crossreferencetest2"
, "children": [
{ "name": "crossreference_test"
},
{ "name": "crossreferencetest1"
, "children": [
{ "name": "crossreference_test"
}
]
}
]
},
{ "name": "crossreferencetest3"
, "children": [
{ "name": "crossreference_test"
},
{ "name": "crossreferencetest2"
, "children": [
{ "name": "crossreference_test"
},
{ "name": "crossreferencetest1"
, "children": [
{ "name": "crossreference_test"
}
]
}
]
}
]
}
]
}
, "caller" :
{ "name": "CrossReferenceTest4"
}
} // CrossReferenceTest4
,
{ "id"     :  "generate"
,   "called" :
{ "name": "generate"
, "children": [
{ "name": "generate_test"
}
]
}
, "caller" :
{ "name": "generate"
}
} // generate
,
{ "id"     :  "getvars"
,   "called" :
{ "name": "getvars"
, "children": [
{ "name": "getvars_test"
}
]
}
, "caller" :
{ "name": "getvars"
}
} // getvars
,
{ "id"     :  "nobs"
,   "called" :
{ "name": "nobs"
, "children": [
{ "name": "nobs_test"
}
]
}
, "caller" :
{ "name": "nobs"
}
} // nobs
,
{ "id"     :  "ProgramDocumentationDummy"
,   "called" :
{ "name": "ProgramDocumentationDummy"
}
, "caller" :
{ "name": "ProgramDocumentationDummy"
}
} // ProgramDocumentationDummy
,
{ "id"     :  "regression"
,   "called" :
{ "name": "regression"
, "children": [
{ "name": "regression_test"
}
]
}
, "caller" :
{ "name": "regression"
}
} // regression
];

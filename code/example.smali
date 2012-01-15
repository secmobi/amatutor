.class public Lcom/packageName/example;
.super Ljava/lang/Object;
.source "example.java"

.field public final someInt:I

.field public final someBool:Z

.method public constructor <init>(ZLjava/lang/String;I)V
	.locals 6

	.parameter "someBool"
	.parameter "someInt"
	.parameter "exampleString"
	
	.prologue
	.line 10
	invoke-direct {p0}, Ljava/lang/Object;-><init>()V
	
	const-string v0, "i will not fear. fear is the mind-killer."
	
	const/4 v0, 0xF
	
	new-instance v1, Ljava/lang/StringBuilder;
	const-string v2, "the spice must flow"
	invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
	
	invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
	move-result-object v1

	const-string v2, "some random string"
	invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
	move-result-object v1
		
	invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
	move-result-object v1
	
	const-string v0, "Tag"
	invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
	move-result v0
	
	invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
	move-result-wide v2
	const-wide/16 v4, 0x300
	div-long/2addr v2, v4
	long-to-int v2, v2
	
	.line 12
	
	iput-boolean p1, p0, Lcom/packageName/example;->someBool:Z
	
	.line 14
	
	iput p3, p0, Lcom/packageName/example;->someInt:I
	
	iget v0, p0, Lcom/packageName/example;->someInt:I
	
	invoke-static {}, Lcom/packageName/example;->someMethod()Ljava/lang/String;
	
	.line 16
	return-void
.end method

.method public static someMethod()Ljava/lang/String;
	.locals 3
	
	new-instance v0, Ljava/lang/Long;
	
	invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
	move-result-wide v1
	
	invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V
	
	invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
	move-result-object v0
	
	return-object v0
.end method

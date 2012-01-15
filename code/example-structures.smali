.class public Lcom/lohan/crackme1/example;
.super Ljava/lang/Object;
.source "example.java"

.field private static Counter:I

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10
    sput v0, Lcom/lohan/crackme1/example;->Counter:I

    return-void
.end method

.method public static ArrayExample()V
    .registers 4

    .prologue
    const/4 v3, 0x1
    const/4 v2, 0x0

    .line 50
    const/4 v1, 0x5

    new-array v0, v1, [Ljava/lang/String;

    .line 52
    .local v0, someArray:[Ljava/lang/String;

    const-string v1, "set value at index 0"
    aput-object v1, v0, v2

    .line 53
    const-string v1, "index 1 has this value"
    aput-object v1, v0, v3

    .line 55
    aget-object v1, v0, v2

    aget-object v2, v0, v3

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1

    if-eqz v1, :cond_1e

    .line 57
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v2, "array at index 0 = 1 (wont happen)"
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 59
    :cond_1e
    return-void
.end method

.method public static LoopExample()V
    .registers 4

    .prologue
    .line 15
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    sget v1, Lcom/lohan/crackme1/example;->Counter:I

    if-lt v0, v1, :cond_6

    .line 17
    return-void

    .line 16
    :cond_6
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;
    const-string v3, "current val for loop: "
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 15
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static SwitchExample()V
    .registers 3

    .prologue
    .line 21
    const/16 v0, 0x2a

    .line 22
    .local v0, val:I
    
    sparse-switch v0, :sswitch_data_2e

    .line 27
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v2, "invalid value"
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 29
    :goto_c
    return-void

    .line 23
    :sswitch_d 
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v2, "val 1"
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    goto :goto_c

    .line 24
    :sswitch_15
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v2, "val 2"
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    goto :goto_c

    .line 25
    :sswitch_1d
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v2, "val 42"
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    goto :goto_c

    .line 26
    :sswitch_25
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v2, "val 5"
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    goto :goto_c

    .line 22
    nop

    :sswitch_data_2e
    .sparse-switch
        0x1 -> :sswitch_d
        0x2 -> :sswitch_15
        0x5 -> :sswitch_25
        0x2a -> :sswitch_1d
    .end sparse-switch
.end method

.method public static TryCatchExample()V
    .registers 8

    .prologue
    const-string v7, ": "

    .line 33
    const-string v3, "google.com"

    .line 36
    .local v3, urlStr:Ljava/lang/String;
    :try_start_4
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 37
    .local v2, url:Ljava/net/URL;
    invoke-virtual {v2}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v1

    .line 38
    .local v1, is:Ljava/io/InputStream;
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_10
    
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_10} :catch_11
    
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_10} :catch_36

    .line 46
    .end local v1
    .end local v2
    :goto_10
    return-void

    .line 39
    :catch_11
    move-exception v4
    move-object v0, v4

    .line 41
    .local v0, e:Ljava/net/MalformedURLException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;
    const-string v6, "Invalid URL "
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5

    const-string v6, ": "
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5

    invoke-virtual {v0}, Ljava/net/MalformedURLException;->getMessage()Ljava/lang/String;
    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_10

    .line 42
    .end local v0
    
    :catch_36
    move-exception v4
    move-object v0, v4

    .line 44
    .local v0, e:Ljava/io/IOException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;
    const-string v6, "Unable to execute "
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5

    const-string v6, ": "
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;
    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_10
.end method

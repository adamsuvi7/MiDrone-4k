.class final Lcom/fimi/soul/biz/map/GoogleTileProvider$CellCallback;
.super Landroid/net/ConnectivityManager$NetworkCallback;

# Tracks the cellular network requested by GoogleTileProvider.requestCellular().


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 0

    sput-object p1, Lcom/fimi/soul/biz/map/GoogleTileProvider;->cellNetwork:Landroid/net/Network;

    return-void
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 1

    sget-object v0, Lcom/fimi/soul/biz/map/GoogleTileProvider;->cellNetwork:Landroid/net/Network;

    invoke-virtual {p1, v0}, Landroid/net/Network;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    sput-object v0, Lcom/fimi/soul/biz/map/GoogleTileProvider;->cellNetwork:Landroid/net/Network;

    :cond_0
    return-void
.end method

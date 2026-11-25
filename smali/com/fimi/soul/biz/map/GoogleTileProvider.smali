.class public Lcom/fimi/soul/biz/map/GoogleTileProvider;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/amap/api/maps/model/TileProvider;

# Google hybrid tiles for AMap. When the phone sits on the remote controller's relay Wi-Fi
# (no internet, but it is the app's default network so the drone link works), tiles are
# downloaded over cellular data instead, so the map does not go blank after connecting.


# static fields
.field static volatile cellNetwork:Landroid/net/Network;

.field private static cellRequested:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Lcom/amap/api/maps/AMap;)Lcom/amap/api/maps/model/TileOverlay;
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    invoke-static {}, Lcom/fimi/soul/biz/map/GoogleTileProvider;->requestCellular()V

    new-instance v1, Lcom/amap/api/maps/model/TileOverlayOptions;

    invoke-direct {v1}, Lcom/amap/api/maps/model/TileOverlayOptions;-><init>()V

    new-instance v2, Lcom/fimi/soul/biz/map/GoogleTileProvider;

    invoke-direct {v2}, Lcom/fimi/soul/biz/map/GoogleTileProvider;-><init>()V

    invoke-virtual {v1, v2}, Lcom/amap/api/maps/model/TileOverlayOptions;->tileProvider(Lcom/amap/api/maps/model/TileProvider;)Lcom/amap/api/maps/model/TileOverlayOptions;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/amap/api/maps/model/TileOverlayOptions;->diskCacheEnabled(Z)Lcom/amap/api/maps/model/TileOverlayOptions;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/amap/api/maps/model/TileOverlayOptions;->memoryCacheEnabled(Z)Lcom/amap/api/maps/model/TileOverlayOptions;

    move-result-object v1

    const/high16 v2, 0x41200000    # 10.0f

    invoke-virtual {v1, v2}, Lcom/amap/api/maps/model/TileOverlayOptions;->zIndex(F)Lcom/amap/api/maps/model/TileOverlayOptions;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/amap/api/maps/AMap;->addTileOverlay(Lcom/amap/api/maps/model/TileOverlayOptions;)Lcom/amap/api/maps/model/TileOverlay;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

# Asks Android to keep cellular data up next to the relay Wi-Fi. Called from the UI thread only.
# shortcut: the request is never unregistered (lives as long as the process), fine for a flight app.
.method private static requestCellular()V
    .locals 3

    sget-boolean v0, Lcom/fimi/soul/biz/map/GoogleTileProvider;->cellRequested:Z

    if-nez v0, :cond_0

    # getActiveNetwork() used by pickNetwork() needs API 23
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    invoke-static {}, Lcom/fimi/soul/base/DroidPlannerApp;->g()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    new-instance v1, Landroid/net/NetworkRequest$Builder;

    invoke-direct {v1}, Landroid/net/NetworkRequest$Builder;-><init>()V

    # NetworkCapabilities.TRANSPORT_CELLULAR
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    move-result-object v1

    # NetworkCapabilities.NET_CAPABILITY_INTERNET
    const/16 v2, 0xc

    invoke-virtual {v1, v2}, Landroid/net/NetworkRequest$Builder;->addCapability(I)Landroid/net/NetworkRequest$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    move-result-object v1

    new-instance v2, Lcom/fimi/soul/biz/map/GoogleTileProvider$CellCallback;

    invoke-direct {v2}, Lcom/fimi/soul/biz/map/GoogleTileProvider$CellCallback;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/net/ConnectivityManager;->requestNetwork(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/fimi/soul/biz/map/GoogleTileProvider;->cellRequested:Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

# Returns the cellular network when the active network has no validated internet
# (relay Wi-Fi), otherwise null = use the default network.
.method private static pickNetwork()Landroid/net/Network;
    .locals 4

    sget-object v0, Lcom/fimi/soul/biz/map/GoogleTileProvider;->cellNetwork:Landroid/net/Network;

    if-eqz v0, :cond_default

    invoke-static {}, Lcom/fimi/soul/base/DroidPlannerApp;->g()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_default

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v2

    if-eqz v2, :cond_cell

    invoke-virtual {v1, v2}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v2

    if-eqz v2, :cond_cell

    # NetworkCapabilities.NET_CAPABILITY_VALIDATED
    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v2

    if-eqz v2, :cond_cell

    :cond_default
    const/4 v0, 0x0

    :cond_cell
    return-object v0
.end method


# virtual methods
.method public getTile(III)Lcom/amap/api/maps/model/Tile;
    .locals 5

    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/fimi/soul/biz/map/GoogleTileProvider;->getTileUrl(III)Ljava/net/URL;

    move-result-object v1

    if-eqz v1, :cond_fail

    invoke-static {}, Lcom/fimi/soul/biz/map/GoogleTileProvider;->pickNetwork()Landroid/net/Network;

    move-result-object v0

    if-eqz v0, :cond_default

    invoke-virtual {v0, v1}, Landroid/net/Network;->openConnection(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v0

    goto :goto_conn

    :cond_default
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    :goto_conn
    const/16 v1, 0x2710

    invoke-virtual {v0, v1}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    invoke-virtual {v0, v1}, Ljava/net/URLConnection;->setReadTimeout(I)V

    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v2, 0x2000

    new-array v2, v2, [B

    :goto_read
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_done

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_read

    :cond_done
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    const/16 v2, 0x100

    new-instance v0, Lcom/amap/api/maps/model/Tile;

    invoke-direct {v0, v2, v2, v1}, Lcom/amap/api/maps/model/Tile;-><init>(II[B)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    :cond_fail
    sget-object v0, Lcom/amap/api/maps/model/TileProvider;->NO_TILE:Lcom/amap/api/maps/model/Tile;

    return-object v0
.end method

.method public getTileHeight()I
    .locals 1

    const/16 v0, 0x100

    return v0
.end method

.method public getTileUrl(III)Ljava/net/URL;
    .locals 5

    :try_start_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "https://mt1.google.com/vt/lyrs=y&x=%d&y=%d&z=%d"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return-object v0
.end method

.method public getTileWidth()I
    .locals 1

    const/16 v0, 0x100

    return v0
.end method

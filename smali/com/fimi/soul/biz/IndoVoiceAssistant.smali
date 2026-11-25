.class public Lcom/fimi/soul/biz/IndoVoiceAssistant;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/speech/tts/TextToSpeech$OnInitListener;


# static fields
.field private static sInstance:Lcom/fimi/soul/biz/IndoVoiceAssistant;


# instance fields
.field private battery15Warned:Z

.field private battery30Warned:Z

.field private homePointWarned:Z

.field private initSensorWarned:Z

.field private isReady:Z

.field private lastAltMilestone:I

.field private lastDistMilestone:I

.field private satLockWarned:Z

.field private gpsWaitWarned:Z

.field private landingSpoken:Z

.field private landedSpoken:Z

.field private tts:Landroid/speech/tts/TextToSpeech;

.field private wasFlying:Z

.field private appCtx:Landroid/content/Context;

.field private ttsLang:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->sInstance:Lcom/fimi/soul/biz/IndoVoiceAssistant;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v2, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->isReady:Z

    iput v2, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    iput v2, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastDistMilestone:I

    iput-boolean v2, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->battery30Warned:Z

    iput-boolean v2, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->battery15Warned:Z

    iput-boolean v2, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->homePointWarned:Z

    iput-boolean v2, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->wasFlying:Z

    iput-boolean v2, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->initSensorWarned:Z

    iput-boolean v2, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->satLockWarned:Z

    iput-boolean v2, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->landingSpoken:Z

    iput-boolean v2, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->landedSpoken:Z

    if-eqz p1, :cond_0

    :try_start_0
    new-instance v0, Landroid/speech/tts/TextToSpeech;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->appCtx:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    iput-object v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->tts:Landroid/speech/tts/TextToSpeech;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/fimi/soul/biz/IndoVoiceAssistant;
    .locals 3

    const-class v1, Lcom/fimi/soul/biz/IndoVoiceAssistant;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->sInstance:Lcom/fimi/soul/biz/IndoVoiceAssistant;

    if-nez v0, :cond_0

    if-eqz p0, :cond_0

    new-instance v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/fimi/soul/biz/IndoVoiceAssistant;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->sInstance:Lcom/fimi/soul/biz/IndoVoiceAssistant;

    :cond_0
    sget-object v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->sInstance:Lcom/fimi/soul/biz/IndoVoiceAssistant;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getInstance()Lcom/fimi/soul/biz/IndoVoiceAssistant;
    .locals 1

    sget-object v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->sInstance:Lcom/fimi/soul/biz/IndoVoiceAssistant;

    return-object v0
.end method

.method public static handleAltitude(D)V
    .locals 2

    :try_start_0
    sget-object v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->sInstance:Lcom/fimi/soul/biz/IndoVoiceAssistant;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0, p1}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->onAltitudeChange(D)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0
    goto :goto_0
.end method

.method public static handleDistance(D)V
    .locals 2

    :try_start_0
    sget-object v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->sInstance:Lcom/fimi/soul/biz/IndoVoiceAssistant;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0, p1}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->onDistanceChange(D)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0
    goto :goto_0
.end method

.method public static handleDroneEvent(Lcom/fimi/soul/drone/d$a;Lcom/fimi/soul/drone/a;)V
    .locals 3

    if-eqz p0, :cond_ret

    :try_start_0
    sget-object v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->sInstance:Lcom/fimi/soul/biz/IndoVoiceAssistant;

    if-nez v0, :cond_inst_ok

    goto/16 :cond_ret

    :cond_inst_ok
    if-eqz p1, :cond_check_event

    # v8: follow the FC fault flags (same source as the on-screen warnings); ax()==10 is only the "formatting" sub-state
    invoke-virtual {p1}, Lcom/fimi/soul/drone/a;->an()Lcom/fimi/soul/drone/i/x;

    move-result-object v1

    if-eqz v1, :cond_check_event

    invoke-virtual {v1}, Lcom/fimi/soul/drone/i/x;->s()Z

    move-result v2

    if-eqz v2, :cond_imu_ready

    iget-boolean v2, v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->initSensorWarned:Z

    if-nez v2, :cond_check_event

    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->initSensorWarned:Z

    const-string v2, "Sistem drone sedang inisialisasi sensor. Harap letakkan drone diam di lantai datar."

    invoke-virtual {v0, v2}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    goto :cond_check_event

    :cond_imu_ready
    iget-boolean v2, v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->initSensorWarned:Z

    if-eqz v2, :cond_check_sats

    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->initSensorWarned:Z

    const-string v2, "Inisialisasi sensor selesai."

    invoke-virtual {v0, v2}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    :cond_check_sats
    invoke-virtual {p1}, Lcom/fimi/soul/drone/a;->al()Z

    move-result v2

    if-nez v2, :cond_check_event

    invoke-virtual {p1}, Lcom/fimi/soul/drone/a;->w()Lcom/fimi/soul/drone/i/aq;

    move-result-object v2

    if-eqz v2, :cond_check_event

    invoke-virtual {v2}, Lcom/fimi/soul/drone/i/aq;->d()B

    move-result v2

    add-int/lit8 v2, v2, -0xa

    if-gez v2, :cond_sats_ok

    # under 10 satellites: re-arm the GPS announcements only once the fix is really lost (< 6)
    add-int/lit8 v2, v2, 0x4

    if-gez v2, :cond_check_event

    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->satLockWarned:Z

    iput-boolean v2, v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->gpsWaitWarned:Z

    goto :cond_check_event

    :cond_sats_ok
    iget-boolean v2, v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->satLockWarned:Z

    if-nez v2, :cond_check_event

    # satellites alone do not unlock takeoff: the FC also waits for its position-accuracy flag (x.L) to clear
    invoke-virtual {v1}, Lcom/fimi/soul/drone/i/x;->L()Z

    move-result v1

    if-eqz v1, :cond_gps_ready

    iget-boolean v1, v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->gpsWaitWarned:Z

    if-nez v1, :cond_check_event

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->gpsWaitWarned:Z

    const-string v1, "Satelit GPS sudah cukup. Menunggu akurasi posisi stabil, biarkan drone diam di tempat terbuka."

    invoke-virtual {v0, v1}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    goto :cond_check_event

    :cond_gps_ready
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->satLockWarned:Z

    const-string v1, "GPS siap, akurasi posisi baik. Drone siap lepas landas."

    invoke-virtual {v0, v1}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    :cond_check_event
    invoke-virtual {p0}, Lcom/fimi/soul/drone/d$a;->name()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_name_ok

    return-void

    :cond_name_ok
    const-string v2, "HOMEPOINT"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_home

    const-string v2, "NEWHOMEPOINT"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_retake

    :cond_home
    invoke-virtual {v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->onHomePointRecorded()V

    return-void

    :cond_retake
    const-string v2, "RETAKEUP"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_rehome

    invoke-virtual {v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->onTakeoff()V

    return-void

    :cond_rehome
    const-string v2, "REHOME"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_reland

    invoke-virtual {v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->onReturnToHome()V

    return-void

    :cond_reland
    const-string v2, "RELANDING"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_floor

    invoke-virtual {v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->onLanding()V

    return-void

    :cond_floor
    const-string v2, "NOTIDRONEFLOOR"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_landed

    const-string v2, "DRONEINFLOOR"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_conn

    :cond_landed
    invoke-virtual {v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->onLanded()V

    return-void

    :cond_conn
    const-string v2, "CONNECTSUCESS"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_bat

    invoke-virtual {v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->onConnected()V

    return-void

    :cond_bat
    const-string v2, "BATTERYINFO"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_bat_read

    const-string v2, "BATTERY"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ret

    :cond_bat_read
    if-eqz p1, :cond_ret

    invoke-virtual {p1}, Lcom/fimi/soul/drone/a;->y()Lcom/fimi/soul/drone/i/d;

    move-result-object v1

    if-eqz v1, :cond_ret

    invoke-virtual {p1}, Lcom/fimi/soul/drone/a;->J()Lcom/fimi/soul/drone/i/e;

    move-result-object v2

    if-eqz v2, :cond_ret

    # v8: same % as the on-screen battery (ShowDroneStatusFragment.i = remaining/full capacity); d.j() is a BMS level code, not a percentage
    invoke-virtual {v2}, Lcom/fimi/soul/drone/i/e;->e()S

    move-result v2

    if-lez v2, :cond_ret

    invoke-virtual {v1}, Lcom/fimi/soul/drone/i/d;->g()S

    move-result v1

    mul-int/lit8 v1, v1, 0x64

    div-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->onBatteryChange(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_ret
    :goto_0
    return-void

    :catch_0
    move-exception v0
    goto :goto_0
.end method


# virtual methods
.method public onInit(I)V
    .locals 3

    if-nez p1, :cond_1

    :try_start_0
    new-instance v0, Ljava/util/Locale;

    const-string v1, "id"

    const-string v2, "ID"

    invoke-direct {v0, v1, v2}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->tts:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v1, v0}, Landroid/speech/tts/TextToSpeech;->setLanguage(Ljava/util/Locale;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v1, -0x2

    if-ne v0, v1, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->tts:Landroid/speech/tts/TextToSpeech;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/speech/tts/TextToSpeech;->setLanguage(Ljava/util/Locale;)I

    :goto_0
    iget-object v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->tts:Landroid/speech/tts/TextToSpeech;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/speech/tts/TextToSpeech;->setPitch(F)I

    iget-object v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->tts:Landroid/speech/tts/TextToSpeech;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/speech/tts/TextToSpeech;->setSpeechRate(F)I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->isReady:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_1
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :cond_2
    goto :goto_0
.end method

.method public speak(Ljava/lang/String;)V
    .locals 4

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->isReady:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v0, :cond_0

    :try_start_0
    # v8: follow the ID/EN switch on every call; the process (and this TTS) survives the language restart
    iget-object v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->appCtx:Landroid/content/Context;

    invoke-static {v1}, Lcom/fimi/soul/biz/LanguageManager;->getLanguage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "en"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_id

    invoke-static {p1}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->toEnglish(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "en"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    goto :goto_lang

    :cond_id
    const-string v1, "id"

    new-instance v3, Ljava/util/Locale;

    const-string v2, "ID"

    invoke-direct {v3, v1, v2}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :goto_lang
    iget-object v2, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->ttsLang:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_lang_ok

    iput-object v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->ttsLang:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/speech/tts/TextToSpeech;->setLanguage(Ljava/util/Locale;)I

    move-result v2

    if-gez v2, :cond_lang_ok

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/speech/tts/TextToSpeech;->setLanguage(Ljava/util/Locale;)I

    :cond_lang_ok
    # QUEUE_ADD: a new line never cuts off a warning that is still being spoken
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/String;ILjava/util/HashMap;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public onAltitudeChange(D)V
    .locals 6

    const-wide/high16 v4, 0x4014000000000000L    # 5.0

    cmpg-double v0, p1, v4

    if-gez v0, :cond_1

    iget-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->wasFlying:Z

    if-eqz v0, :cond_0

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpg-double v0, p1, v4

    if-gez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->wasFlying:Z

    iput v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    invoke-virtual {p0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->onLanded()V

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->wasFlying:Z

    const-wide/high16 v4, 0x4014000000000000L    # 5.0
    cmpl-double v0, p1, v4
    if-ltz v0, :cond_alt_reset_end

    const/4 v0, 0x0
    iput-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->landingSpoken:Z
    iput-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->landedSpoken:Z

    :cond_alt_reset_end
    # Check 500m
    const-wide v4, 0x407f400000000000L    # 500.0
    cmpl-double v0, p1, v4
    if-ltz v0, :cond_2

    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const/16 v1, 0x1f4
    if-ge v0, v1, :cond_9

    iput v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const-string v0, "Peringatan, batas maksimal ketinggian lima ratus meter."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    # Check 400m
    :cond_2
    const-wide v4, 0x4079000000000000L    # 400.0
    cmpl-double v0, p1, v4
    if-ltz v0, :cond_3

    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const/16 v1, 0x190
    if-ge v0, v1, :cond_9

    iput v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const-string v0, "Ketinggian empat ratus meter."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    # Check 300m
    :cond_3
    const-wide v4, 0x4072c00000000000L    # 300.0
    cmpl-double v0, p1, v4
    if-ltz v0, :cond_4

    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const/16 v1, 0x12c
    if-ge v0, v1, :cond_9

    iput v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const-string v0, "Peringatan, ketinggian tiga ratus meter."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    # Check 200m
    :cond_4
    const-wide v4, 0x4069000000000000L    # 200.0
    cmpl-double v0, p1, v4
    if-ltz v0, :cond_5

    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const/16 v1, 0xc8
    if-ge v0, v1, :cond_9

    iput v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const-string v0, "Peringatan, ketinggian dua ratus meter."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    # Check 150m
    :cond_5
    const-wide v4, 0x4062c00000000000L    # 150.0
    cmpl-double v0, p1, v4
    if-ltz v0, :cond_6

    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const/16 v1, 0x96
    if-ge v0, v1, :cond_9

    iput v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const-string v0, "Peringatan, ketinggian seratus lima puluh meter. Perhatikan batas aman."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    # Check 100m
    :cond_6
    const-wide/high16 v4, 0x4059000000000000L    # 100.0
    cmpl-double v0, p1, v4
    if-ltz v0, :cond_7

    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const/16 v1, 0x64
    if-ge v0, v1, :cond_9

    iput v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const-string v0, "Peringatan, ketinggian seratus meter."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    # Check 50m
    :cond_7
    const-wide/high16 v4, 0x4049000000000000L    # 50.0
    cmpl-double v0, p1, v4
    if-ltz v0, :cond_8

    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const/16 v1, 0x32
    if-ge v0, v1, :cond_9

    iput v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const-string v0, "Ketinggian lima puluh meter."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    # Check 20m
    :cond_8
    const-wide/high16 v4, 0x4034000000000000L    # 20.0
    cmpl-double v0, p1, v4
    if-ltz v0, :cond_9

    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const/16 v1, 0x14
    if-ge v0, v1, :cond_9

    iput v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const-string v0, "Ketinggian dua puluh meter."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    # Hysteresis reset on descent
    :cond_9
    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const/16 v1, 0x64
    if-lt v0, v1, :cond_a

    const-wide/high16 v4, 0x4055000000000000L    # 84.0
    cmpg-double v0, p1, v4
    if-gez v0, :cond_a

    const/16 v0, 0x32
    iput v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    return-void

    :cond_a
    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const/16 v1, 0x32
    if-lt v0, v1, :cond_b

    const-wide/high16 v4, 0x4041000000000000L    # 34.0
    cmpg-double v0, p1, v4
    if-gez v0, :cond_b

    const/16 v0, 0x14
    iput v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    return-void

    :cond_b
    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    const/16 v1, 0x14
    if-lt v0, v1, :cond_c

    const-wide/high16 v4, 0x4028000000000000L    # 12.0
    cmpg-double v0, p1, v4
    if-gez v0, :cond_c

    const/4 v0, 0x0

    iput v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastAltMilestone:I

    :cond_c
    return-void
.end method

.method public onDistanceChange(D)V
    .locals 6

    # Check 1000m (1 km)
    const-wide v4, 0x408f400000000000L    # 1000.0
    cmpl-double v0, p1, v4
    if-ltz v0, :cond_0

    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastDistMilestone:I

    const/16 v1, 0x3e8
    if-ge v0, v1, :cond_4

    iput v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastDistMilestone:I

    const-string v0, "Jarak drone satu kilometer dari titik asal."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    # Check 500m
    :cond_0
    const-wide v4, 0x407f400000000000L    # 500.0
    cmpl-double v0, p1, v4
    if-ltz v0, :cond_1

    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastDistMilestone:I

    const/16 v1, 0x1f4
    if-ge v0, v1, :cond_4

    iput v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastDistMilestone:I

    const-string v0, "Jarak drone lima ratus meter, jaga jarak pandang visual."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    # Check 300m
    :cond_1
    const-wide v4, 0x4072c00000000000L    # 300.0
    cmpl-double v0, p1, v4
    if-ltz v0, :cond_2

    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastDistMilestone:I

    const/16 v1, 0x12c
    if-ge v0, v1, :cond_4

    iput v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastDistMilestone:I

    const-string v0, "Jarak drone tiga ratus meter."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    # Check 100m
    :cond_2
    const-wide/high16 v4, 0x4059000000000000L    # 100.0
    cmpl-double v0, p1, v4
    if-ltz v0, :cond_3

    iget v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastDistMilestone:I

    const/16 v1, 0x64
    if-ge v0, v1, :cond_4

    iput v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastDistMilestone:I

    const-string v0, "Jarak drone seratus meter dari titik asal."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    :cond_3
    # Hysteresis for distance returning home
    const-wide/high16 v4, 0x4051000000000000L    # 68.0
    cmpg-double v0, p1, v4
    if-gez v0, :cond_4

    const/4 v0, 0x0

    iput v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->lastDistMilestone:I

    :cond_4
    return-void
.end method

.method public onBatteryChange(I)V
    .locals 3

    if-lez p1, :cond_0

    const/16 v0, 0x64

    if-le p1, v0, :cond_1

    :cond_0
    return-void

    :cond_1
    const/16 v0, 0xf

    const/4 v1, 0x1

    if-gt p1, v0, :cond_2

    iget-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->battery15Warned:Z

    if-nez v0, :cond_4

    iput-boolean v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->battery15Warned:Z

    iput-boolean v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->battery30Warned:Z

    const-string v0, "Bahaya! Baterai drone tinggal lima belas persen. Segera daratkan drone."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    :cond_2
    const/16 v0, 0x1e

    if-gt p1, v0, :cond_3

    iget-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->battery30Warned:Z

    if-nez v0, :cond_4

    iput-boolean v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->battery30Warned:Z

    const-string v0, "Perhatian, baterai drone tinggal tiga puluh persen. Disarankan segera kembali."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void

    :cond_3
    const/16 v0, 0x28

    if-le p1, v0, :cond_4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->battery30Warned:Z

    iput-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->battery15Warned:Z

    :cond_4
    return-void
.end method

.method public onHomePointRecorded()V
    .locals 1

    iget-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->homePointWarned:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->homePointWarned:Z

    const-string v0, "Titik asal tersimpan."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onTakeoff()V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->wasFlying:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->landingSpoken:Z

    iput-boolean v1, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->landedSpoken:Z

    const-string v0, "Drone lepas landas."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void
.end method

.method public onReturnToHome()V
    .locals 1

    const-string v0, "Perintah pulang aktif. Drone dalam perjalanan kembali ke titik asal."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void
.end method

.method public onLanding()V
    .locals 2

    iget-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->landingSpoken:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->landingSpoken:Z

    const-string v1, "Drone mulai mendarat, bersiap."

    invoke-virtual {p0, v1}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void
.end method

.method public onLanded()V
    .locals 2

    iget-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->landedSpoken:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fimi/soul/biz/IndoVoiceAssistant;->landedSpoken:Z

    const-string v1, "Drone telah mendarat. Tahan stik kiri ke bawah sampai motor berhenti."

    invoke-virtual {p0, v1}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void
.end method

.method public onConnected()V
    .locals 1

    const-string v0, "Drone terhubung."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void
.end method

.method public onDisconnected()V
    .locals 1

    const-string v0, "Peringatan, koneksi drone terputus."

    invoke-virtual {p0, v0}, Lcom/fimi/soul/biz/IndoVoiceAssistant;->speak(Ljava/lang/String;)V

    return-void
.end method

.method private static toEnglish(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "Sistem drone sedang inisialisasi sensor. Harap letakkan drone diam di lantai datar."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_0

    const-string v0, "Drone system is initializing its sensors. Keep the drone still on flat ground."

    return-object v0

    :next_0
    const-string v0, "Inisialisasi sensor selesai."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_1

    const-string v0, "Sensor initialization complete."

    return-object v0

    :next_1
    const-string v0, "Satelit GPS sudah cukup. Menunggu akurasi posisi stabil, biarkan drone diam di tempat terbuka."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_2

    const-string v0, "Enough GPS satellites. Waiting for position accuracy to stabilize, keep the drone still in open sky."

    return-object v0

    :next_2
    const-string v0, "GPS siap, akurasi posisi baik. Drone siap lepas landas."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_3

    const-string v0, "GPS ready, position accuracy is good. Drone is ready for takeoff."

    return-object v0

    :next_3
    const-string v0, "Peringatan, batas maksimal ketinggian lima ratus meter."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_4

    const-string v0, "Warning, maximum altitude limit of five hundred meters."

    return-object v0

    :next_4
    const-string v0, "Ketinggian empat ratus meter."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_5

    const-string v0, "Altitude four hundred meters."

    return-object v0

    :next_5
    const-string v0, "Peringatan, ketinggian tiga ratus meter."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_6

    const-string v0, "Warning, altitude three hundred meters."

    return-object v0

    :next_6
    const-string v0, "Peringatan, ketinggian dua ratus meter."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_7

    const-string v0, "Warning, altitude two hundred meters."

    return-object v0

    :next_7
    const-string v0, "Peringatan, ketinggian seratus lima puluh meter. Perhatikan batas aman."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_8

    const-string v0, "Warning, altitude one hundred fifty meters. Mind the safe limit."

    return-object v0

    :next_8
    const-string v0, "Peringatan, ketinggian seratus meter."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_9

    const-string v0, "Warning, altitude one hundred meters."

    return-object v0

    :next_9
    const-string v0, "Ketinggian lima puluh meter."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_10

    const-string v0, "Altitude fifty meters."

    return-object v0

    :next_10
    const-string v0, "Ketinggian dua puluh meter."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_11

    const-string v0, "Altitude twenty meters."

    return-object v0

    :next_11
    const-string v0, "Jarak drone satu kilometer dari titik asal."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_12

    const-string v0, "Drone is one kilometer from home."

    return-object v0

    :next_12
    const-string v0, "Jarak drone lima ratus meter, jaga jarak pandang visual."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_13

    const-string v0, "Drone is five hundred meters away, keep visual line of sight."

    return-object v0

    :next_13
    const-string v0, "Jarak drone tiga ratus meter."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_14

    const-string v0, "Drone is three hundred meters away."

    return-object v0

    :next_14
    const-string v0, "Jarak drone seratus meter dari titik asal."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_15

    const-string v0, "Drone is one hundred meters from home."

    return-object v0

    :next_15
    const-string v0, "Bahaya! Baterai drone tinggal lima belas persen. Segera daratkan drone."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_16

    const-string v0, "Danger! Drone battery at fifteen percent. Land the drone now."

    return-object v0

    :next_16
    const-string v0, "Perhatian, baterai drone tinggal tiga puluh persen. Disarankan segera kembali."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_17

    const-string v0, "Attention, drone battery at thirty percent. Return home soon."

    return-object v0

    :next_17
    const-string v0, "Titik asal tersimpan."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_18

    const-string v0, "Home point recorded."

    return-object v0

    :next_18
    const-string v0, "Drone lepas landas."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_19

    const-string v0, "Drone taking off."

    return-object v0

    :next_19
    const-string v0, "Perintah pulang aktif. Drone dalam perjalanan kembali ke titik asal."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_20

    const-string v0, "Return to home active. The drone is flying back to the home point."

    return-object v0

    :next_20
    const-string v0, "Drone mulai mendarat, bersiap."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_21

    const-string v0, "Drone is landing, stand by."

    return-object v0

    :next_21
    const-string v0, "Drone telah mendarat. Tahan stik kiri ke bawah sampai motor berhenti."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_22

    const-string v0, "Drone has landed. Hold the left stick down until the motors stop."

    return-object v0

    :next_22
    const-string v0, "Drone terhubung."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_23

    const-string v0, "Drone connected."

    return-object v0

    :next_23
    const-string v0, "Peringatan, koneksi drone terputus."

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :next_24

    const-string v0, "Warning, drone connection lost."

    return-object v0

    :next_24
    return-object p0
.end method

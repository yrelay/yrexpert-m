;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 29/10/17 ! La partition principale est YXP ou %DIR        !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%UTSTCDI^INT^1^59547,74033^0
%UTSTCDI ;;12:29 PM  13 Oct 1993; ; 30 Sep 93  4:17 PM
 
 
 D CLEPAG^%VVIDEO
 U 0 S DX=4,DY=12 X XY W $$^%QZCHW("Produit B a restaurer ?")
 S MENU2(1)=$$^%QZCHW("DGI")_"^IDGI",MENU2(2)=$$^%QZCHW("TXP")_"^ITXP"
 
 D ^%VQUIKMN(35,78,12,"MENU2",.IREP,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 D @IREP
 
 S ^TOZE($I,"ATTENTE")=2
 K ^TEST
 S LPBME="^TEST(1)",@LPBME=0
 
 S $ZT="G ERREUR^%UTSTCDI"
 
 S ESCHEM=$$TEMP^%SGUTIL,ELOAD=$$TEMP^%SGUTIL
 S FILE2=PATH_"sdd.arc"
 I '($$EXIFILE(FILE2)) G 1
 S ^TEST("GEST","ETQ")="RETSCHEM",^TEST("GEST","MES")="restauration du schema de donnees"
 D M("restauration du schema de donnees")
 D LISCHEM^%SGPXIN2(FILE2,ESCHEM)
 D CHARGER^%SGPXIN2(FILE2,1,ESCHEM,1,0,ELOAD)
RETSCHEM 
 
 S ^TEST("GEST","ETQ")="INSSCHEM",^TEST("GEST","MES")="verification et installation schema"
 D M("verification et installation du schema de donnees")
 S SCHEM="" F %SC=0:0 S SCHEM=$O(@ESCHEM@(SCHEM)) Q:SCHEM=""  D QSVERI(SCHEM),^%QSMODEL(1,SCHEM,QUI,WHOIS)
INSCHEM 
 
1 
 
 
 S FILE2=PATH_"attdate.ind"
 S ^TEST("GEST","ETQ")="RETDATE",^TEST("GEST","MES")="restauration des attributs date"
 I $$EXIFILE(FILE2) D M("restauration des dates"),RESTDON^%SGPDIN2(FILE2,0,2)
RETDATE 
 
 
 S FILE2=PATH_RESOARD
 S ^TEST("GEST","ETQ")="RETRESO",^TEST("GEST","MES")="restauration du reseau du produit B"
 I $$EXIFILE(FILE2) D M("restauration du reseau"),IN^%QMEXIN(PATH_RESOARD,PATH_RESOARC,PATH_RESOAR2)
 
RETRESO 
 
 
 
 
 S FILE2=PATH_"trtcompl.arc"
 S ^TEST("GEST","ETQ")="RETTRT",^TEST("GEST","MES")="restauration des connaissances specifiques et des masques"
 I $$EXIFILE(FILE2) D M("restauration des masques et des connaissances specifiques"),RESTK^%QMEXIN
RETTRT 
 
 
 
 
 
 S FILE2=PATH_"const.ind"
 S ^TEST("GEST","ETQ")="RETICST",^TEST("GEST","MES")="restauration des indiovidus constantes"
 I $$EXIFILE(FILE2) D M("restauration des individus constantes"),RESTDON^%SGPDIN2(FILE2,0,2)
RETICST 
 
 
 
 
 S FILE2=PATH_"saisie.ind"
 S ^TEST("GEST","ETQ")="RETISAI",^TEST("GEST","MES")="restauration des saisies interactives"
 I $$EXIFILE(FILE2) D M("restauration des individus saisie interactive"),RESTDON^%SGPDIN2(FILE2,0,2)
RETISAI 
 
 
 
 
 S FILE2=PATH_"config.ind"
 S ^TEST("GEST","ETQ")="RETICNF",^TEST("GEST","MES")="restauration des configurations"
 I $$EXIFILE(FILE2) D M("restauration des configurations"),RESTDON^%SGPDIN2(FILE2,0,2)
RETICNF 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 S FILE2=PATH_FILEGLOB
 I '($$EXIFILE(FILE2)) G 10
 D M("restauration des globals")
 S ^TEST("GEST","ETQ")="RETGIGLO",^TEST("GEST","MES")="restauration des globals"
 S OK=$$GI^%SYSSAVE(FILE2,QUI)
 I '(OK) G ERREUR
RETGIGLO 
 
 D M("validations saisies multiples et copies")
 S ^TEST("GEST","ETQ")="RETANSM",^TEST("GEST","MES")="validation des saisies multiples"
 D ALL^%QUBKKV
RETANSM 
 S ^TEST("GEST","ETQ")="RETANCO",^TEST("GEST","MES")="validation des copies"
 D VERIFALL^%QMCP4
RETANCO 
 
 
 
10 S FILE2=PATH_"TRTECHNO.ARC"
 S ^TEST("GEST","ETQ")="RETGKCL",^TEST("GEST","MES")="restauration des connaissances client"
 I $$EXIFILE(FILE2) D M("restauration des connaissances clients"),RESTK^%QMEXIN
RETGKCL 
 
 
 
 S FILE2=PATH_"TECHNO.IND"
 S ^TEST("GEST","ETQ")="RETGITEC",^TEST("GEST","MES")="restauration des technologies client"
 I $$EXIFILE(FILE2) D M("restauration des technologies clients"),RESTDON^%SGPDIN2(FILE2,0,2)
RETGITEC 
 
 
 S FILE2=PATH_"TOTEM.GBL"
 I '($$EXIFILE(FILE2)) G 13
 S GLOPOCH=$$TEMP^%SGUTIL
 D M("restauration totem")
 S ^TEST("GEST","ETQ")="RETGTOT",^TEST("GEST","MES")="restauration de totem"
 D LIREPOCH^TOGSSFRE(FILE2,GLOPOCH)
 S O="" F %O=0:0 S O=$O(@GLOPOCH@(O)) Q:O=""  S LIB="" F %ILIB=0:0 S LIB=$O(@GLOPOCH@(O,LIB)) Q:LIB=""  D MSG^%VZEATT($$^%QZCHW("suppression de")_" "_LIB) S OBJ=O D ^TODELOBJ,OFF^%VZEATT
 S RESLOAD=$$GI^%SYSSAVE(FILE2,QUI)
 I '(RESLOAD) S @LPBME=@LPBME+1,@LPBME@(@LPBME)="Probleme lors de la restauration TOTEM ("_FILE2_")"
RETGTOT 
 
 
13 
 S FILE2=PATH_"artdemo.ind"
 S ^TEST("GEST","ETQ")="RETGDMO1",^TEST("GEST","MES")="restauration des articles de demo"
 I $$EXIFILE(FILE2) D M("restauration des articles de demo"),RESTDON^%SGPDIN2(FILE2,0,2)
RETGDMO1 
 
 
 S FILE2=PATH_"ssdemo.ind"
 S ^TEST("GEST","ETQ")="RETGDMO2",^TEST("GEST","MES")="restauration des sous-ensembles de demo"
 I $$EXIFILE(FILE2) D M("restauration des sous-ensembles de demo"),RESTDON^%SGPDIN2(FILE2,0,2)
RETGDMO2 
 
 S FILE2=PATH_"PREDDEMO.ARC"
 S ^TEST("GEST","ETQ")="RETGDMO3",^TEST("GEST","MES")="restauration des predicats de demo"
 I $$EXIFILE(FILE2) D M("restauration des predicats de demo"),RESTK^%QMEXIN
RETGDMO3 
 
 
 S FILE2=PATH_"demo.ard"
 S ^TEST("GEST","ETQ")="RETGDMO",^TEST("GEST","MES")="restauration du reseau de demo"
 I $$EXIFILE(FILE2) D M("restauration du reseau de demo"),IN^%QMEXIN(PATH_"demo.ard",PATH_"demo.arc",PATH_"demo.ar2")
RETGDMO 
 
 
 D M("comprehension des reseaux")
 S ^TEST("GEST","ETQ")="RETANRES",^TEST("GEST","MES")="comprehension de tous les reseaux"
 S LISTE=$$TEMP^%SGUTIL
 S I="" F %I=0:0 S I=$$NXTRI^%QSTRUC8("RESEAU",I) Q:I=""  I $$^%QSCALIN("RESEAU",I,"TYPE.ATN",1)="RESEAU HEVEA" S @LISTE@(I)=""
 D COMPIL^%QMEXATN(LISTE)
 K @(LISTE)
RETANRES 
 
 
 D M("validation et comprehension totem")
 ;HL002 U 0 S ^TABIDENT($I,"%UCI")="MOZ",^TABIDENT($I)=""
 D INT^%DIR
 U 0 S ^TABIDENT($I,"%UCI")=%DIR,^TABIDENT($I)=""
 S ^TEST("GEST","ETQ")="RETANTOT",^TEST("GEST","MES")="validation totem"
 D ^TOV2,^TOV3,^%ABV4,^TOV6,^TOV51,^TOV52,^%ABV4,^TOV6,^TOV51,^TOV52
RETANTOT 
 
reg 
 S ^TEST("GEST","ETQ")="RETGENCA",^TEST("GEST","MES")="installation des regimes calendaires standard"
 D INSTAL^%QMDRSTA
RETGENCA 
 S ^TEST("GEST","ETQ")="RETANTOT",^TEST("GEST","MES")="comprehension des regimes calendaires"
 F AN=92:1:96 F REG="STANDARD","STANDARD.2.EQUIPES","STANDARD.3.EQUIPES" D ^%QMDRCAL(AN,REG)
RETCMPCA 
 S $ZT="",^TOZE($I,"ATTENTE")=900
CR 
 S XG=1,YH=2,DV=18,DH=78
 D CLFEN^%VVIDEO(XG,YH,DV,DH),CARSA^%VVIDEO(XG,YH,DH,DV)
 D REAFF2^%QULIMO3(1,1,"^TEST(1)",XG,YH,DH,DV,0)
 D VISU^%QULIMO(XG,YH,DH,DV,"^TEST(1)",1)
 Q
 
EXIFILE(FILE) 
 S $ZT="G NEXIFI"
 O 12:("R":FILE):0 E  G NEXIFI
 S $ZT="" C 12 Q 1
NEXIFI S $ZT="",@LPBME=@LPBME+1,@LPBME@(@LPBME)="<WARNING> pas de fichier "_FILE
 Q 0
 
QSVERI(M) 
 N VDEF,MES,DX1,DY1,CTR,YY1,TEMP,COL,HIER,RR,TABLI,NOLIEN,TEMPO,SYSVU,LREPCR
 
 D MSG^%VZEATT(" verification de "_M)
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S TEMPO=$$CONCAS^%QZCHAD(TEMP,"TEMPO")
 S COL=$$CONCAS^%QZCHAD(TEMP,"COL")
 S HIER=$$CONCAS^%QZCHAD(TEMP,"HIER")
 S RR=$$CONCAS^%QZCHAD(TEMP,"RR")
 S TABLI=$$CONCAS^%QZCHAD(TEMP,"TABLIEN")
 S NOLIEN=$$CONCAS^%QZCHAD(TEMP,"NOMLIEN")
 S SYSVU=$$CONCAS^%QZCHAD(TEMP,"SYSVU")
 S LREPCR=$$CONCAS^%QZCHAD(TEMP,"LREPCR")
 D VERIF^%QSVERI0
 K @(TEMP)
 Q
 
M(M) N Y S Y="1,1\RLWY\1\\\",Y(1)=$E(M_"                                                                        ",1,72)_"*" D ^%PKPOP Q
 Q
 
INIFILE 
ITXP 
 S PATH="C:\LIVRTXP\"
 S RESOARC="TXP.ARC",RESOARD="TXP.ARD",RESOAR2="TXP.AR2"
 S FILEGLOB="TXP.GBL"
 Q
 
IDGI 
 S PATH="C:\LIVRDGI\"
 S RESOARC="DGI.ARC",RESOARD="DGI.ARD",RESOAR2="DGI.AR2"
 S FILEGLOB="DGI.GBL"
 Q
ERREUR 
 S ETQ=^TEST("GEST","ETQ")
 S LPBME="^TEST(1)"
 S @LPBME=@LPBME+1,@LPBME@(@LPBME)="<ERROR> lors de : "_^TEST("GEST","MES")
 S @LPBME=@LPBME+1,@LPBME@(@LPBME)=$ZE
 G @ETQ


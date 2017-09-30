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
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%TXB^INT^1^59547,74031^0
%TXB ;;05:34 PM  11 Oct 1993; ; 26 Mar 93  4:18 PM
 
 N %C,%R,PK,X,Y,I,STO,VAL,VALDEF,STOCK,SOR
 N GG,ECRAN,OO
 N RELIEF
 S RELIEF=0
 S OO=1
 K ^%vidx($ZZNODE,$J)
 S ^%PK($I)="DTCOLOR"
 D CLEPAG^%VVIDEO,MENKEY
 D ENTETE
 S GG=$$TEMP^%SGUTIL
 S ECRAN=$$TEMP^%SGUTIL
 D INITGG^%TXBM
 F OBJET="ARTICLE","FOURNISSEUR" S GLO=$$CONCAS^%QZCHAD(ECRAN,OBJET),TITRE=OBJET D INITMSQ^%TXBM
 S OBJET="CONTRAT",GLO=$$CONCAS^%QZCHAD(ECRAN,OBJET),TITRE=OBJET D INITMSQ^%TXBM3
 S OBJET="COMMANDE",GLO=$$CONCAS^%QZCHAD(ECRAN,OBJET),TITRE=OBJET D INITMSQ^%TXBM4
 S OBJET="LIVRAISON",GLO=$$CONCAS^%QZCHAD(ECRAN,OBJET),TITRE=OBJET D INITMSQ^%TXBM5
 F OBJET="ARTICLE","FOURNISSEUR","COMMANDE","CONTRAT","LIVRAISON" S FIXED(OBJET)=0
 S PILE=$$TEMP^%SGUTIL
 S @PILE=0
 
 
AGA 
 R *x:^TOZE($I,"ATTENTE") I x=-1 G:@PILE=0 FIN G ESCA
 G:x=21 ART G:x=23 FOURN G:x=25 COMM G:x=24 CONTR G:x=26 LIVR
 G:x=28 EDIT G:x=29 COMM G:x=22 FRNPRX
 I x'=27 D MINHLP G AGA
 I x=27 G:@PILE=0 FIN
ESCA S FIXED(@PILE@(@PILE))=0
 K @PILE@(@PILE) S @PILE=@PILE-1 W /WCLOSE D:OO DEP^%SGVAR("FOREGROUND"),DEP^%SGVAR("BACKGROUND") W:RELIEF /WCLOSE
 G:@PILE=0 AGA
 S MN=@PILE@(@PILE,"MN"),OBJET=@PILE@(@PILE),GLO=$$CONCAS^%QZCHAD(ECRAN,OBJET)
 G MENU
FIN D FENTETE
 D ^%funckey(""),longwin^%funckey("")
 S ^%PK($I)="DTMPC"
 Q
EDIT F %I=0:0 Q:@PILE=0  S FIXED(@PILE@(@PILE))=0 K @PILE@(@PILE) S @PILE=@PILE-1 W /WCLOSE W:RELIEF /WCLOSE
 
 D FENTETE,^%funckey(""),longwin^%funckey(""),FENTETE
 S ^%PK($I)="DTMPC" K PK
 D:OO SET^%SGVAR("FOREGROUND",""),SET^%SGVAR("BACKGROUND","")
 D ACTDIR^%QMEXGES("ACH.DKBMS.ACHAT","%",$J)
 D:OO DEP^%SGVAR("FOREGROUND"),DEP^%SGVAR("BACKGROUND")
 S ^%PK($I)="DTCOLOR" K PK
 D CLEPAG^%VVIDEO,MENKEY,ENTETE
 G AGA
 
ART S OBJET="ARTICLE" G GET
FOURN S OBJET="FOURNISSEUR" G GET
COMM S OBJET="COMMANDE" G GET
CONTR S OBJET="CONTRAT" G GET
LIVR S OBJET="LIVRAISON" G GET
FRNPRX I '(FIXED("ARTICLE")) D SPEPRIX G AGA
 G ^%TXBPRIX
 
 
GET S @PILE=@PILE+1,@PILE@(@PILE)=OBJET
 S POSX=@PILE*4,POSY=((@PILE-1)*3)+1
 S FIXED(OBJET)=1
 D CURON^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$CONCAS^%QZCHAD(ECRAN,OBJET)
 S NBKEY=@GG@(OBJET,"NBCHAMPS")
 S NBC=(NBKEY*2)-1
 I RELIEF W /WOPEN(POSX+1,POSY+1,58,@GG@(OBJET,"NBLIGNES"),"","","","","tc"),/COLOR(1,3),/CLR
 W /WOPEN(POSX,POSY,58,@GG@(OBJET,"NBLIGNES"),"","","","","tc"),/COLOR(@GG@(OBJET,"FOREGROUND"),@GG@(OBJET,"BACKGROUND")),/CLR
 D:OO SET^%SGVAR("FOREGROUND",@GG@(OBJET,"FOREGROUND")),SET^%SGVAR("BACKGROUND",@GG@(OBJET,"BACKGROUND"))
 K VALDEF F I=1:1:NBC S VALDEF(I)=""
 S VALDEF="STOCK"
 K STOCK
 
 D:OBJET="CONTRAT" CMS^%TXBM3
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 I '($D(STOCK)) G ESCA
 
 
 K VALDEF S VALDEF="STOCK"
 S (MN,@PILE@(@PILE,"MN"))=$$MKMENU
 G:OBJET="ARTICLE" G1 G:OBJET="FOURNISSEUR" G2 G:OBJET="CONTRAT" G3 G:OBJET="COMMANDE" G4 G:OBJET="LIVRAISON" G5
G1 F I=1:1:3 S VALDEF(I)=""
 S ART=$P(STOCK,$C(0),1)
 G:$$IR^%QSGE5("ARTICLE",ART) G10
 S ART2=$S(FIXED("FOURNISSEUR"):$$SUIVAF^%TXBSUI(ART,FRN),1:$$SUIVA^%TXBSUI(ART)) I ART2="" D ECHEC G MENU
 S ART=ART2
G10 S VALDEF(1)=ART,VALDEF(3)=$$^%QSCALIN("ARTICLE",ART,"DESIGNATION",1) G GF
 
G2 F I=1 S VALDEF(I)=""
 S FRN=$P(STOCK,$C(0),1)
 G:$$IR^%QSGE5("FOURNISSEUR",FRN) G20
 S FRN2=$S(FIXED("ARTICLE"):$$SUIVFA^%TXBSUI(FRN,ART),1:$$SUIVF^%TXBSUI(FRN))
 I FRN2="" D ECHEC G MENU
 S FRN=FRN2
G20 S VALDEF(1)=FRN
 G GF
 
 
G3 F I=1:1:5 S VALDEF(I)=""
 S CNTRA=$S(($P(STOCK,$C(0),3)'="")&($P(STOCK,$C(0))'=""):$P(STOCK,$C(0),3)_","_$P(STOCK,$C(0),1),1:"")
 G:$$IR^%QSGE5("CONTRAT",CNTRA) G30
 S CNTRA2=$S(FIXED("ARTICLE")&FIXED("FOURNISSEUR"):$$SUIVCAF^%TXBSUI(CNTRA,ART,FRN),FIXED("ARTICLE"):$$SUIVCA^%TXBSUI(CNTRA,ART),FIXED("FOURNISSEUR"):$$SUIVCF^%TXBSUI(CNTRA,FRN),1:$$SUIVC^%TXBSUI(CNTRA))
 I CNTRA2="" D ECHEC G MENU
 S CNTRA=CNTRA2
G30 S VALDEF(1)=$P(CNTRA,",",2),VALDEF(3)=$P(CNTRA,","),VALDEF(5)=$$^%QSCALVA("CONTRAT",CNTRA,"FOURNISSEUR.RETENU")
 G GF
 
 
G4 F I=1:1:4 S VALDEF(I)=""
 S COMM=$S((($P(STOCK,$C(0),2)'="")&($P(STOCK,$C(0))'=""))&($P(STOCK,$C(0),3)'=""):$P(STOCK,$C(0),2)_","_$P(STOCK,$C(0),3)_","_$P(STOCK,$C(0)),1:"")
 G:$$IR^%QSGE5("COMMANDE",COMM) G30
 S COMM2=$S(FIXED("CONTRAT"):$$SUIVMC^%TXBSUI(COMM,CNTRA),1:$$SUIVM^%TXBSUI(COMM))
 I COMM2="" D ECHEC G MENU
 S COMM=COMM2
G40 S VALDEF(1)=$P(COMM,",",3),VALDEF(2)=$P(COMM,","),VALDEF(3)=$P(COMM,",",2),VALDEF(4)=$$^%QSCALVA("CONTRAT",$P(COMM,",",1,2),"FOURNISSEUR.RETENU")
 G GF
 
 
G5 F I=1:1:5 S VALDEF(I)=""
 S LIVR=$S(((($P(STOCK,$C(0),2)'="")&($P(STOCK,$C(0))'=""))&($P(STOCK,$C(0),3)'=""))&($P(STOCK,$C(0),4)'=""):$P(STOCK,$C(0),3)_","_$P(STOCK,$C(0),4)_","_$P(STOCK,$C(0),2)_","_$P(STOCK,$C(0)),1:"")
 G:$$IR^%QSGE5("LIVRAISON",LIVR) G50
 S LIVR2=$S(FIXED("COMMANDE"):$$SUIVLM^%TXBSUI(LIVR,COMM),FIXED("ARTICLE"):$$SUIVLA^%TXBSUI(LIVR,ART),1:$$SUIVL^%TXBSUI(LIVR))
 I LIVR2="" D ECHEC G MENU
 S LIVR=LIVR2
G50 S VALDEF(1)=$P(LIVR,",",4),VALDEF(2)=$P(LIVR,",",3),VALDEF(3)=$P(LIVR,","),VALDEF(4)=$P(LIVR,",",2),VALDEF(5)=$$^%QSCALVA("CONTRAT",$P(LIVR,",",1,2),"FOURNISSEUR.RETENU")
 G GF
 
 
GF 
 D AFF^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
MENU 
 W /COLOR(@GG@(OBJET,"FOREGROUND"),@GG@(OBJET,"BACKGROUND"))
 S NBC=(@GG@(OBJET,"NBCHAMPS")*2)-1
 S DX=0,DY=NBC+2 X XY
 
 D ^%VQUIKMN(0,55,@GG@(OBJET,"NBLIGNES")-2,MN,.x,.CTRO)
 
 G:CTRO="V" ^%TXBPRIX
 G:CTRO'="B" MENU2
 S IND=$S(OBJET="ARTICLE":ART,OBJET="FOURNISSEUR":FRN,OBJET="CONTRAT":CNTRA,OBJET="COMMANDE":COMM)
 G:IND="" MENU
 S ^%PK($I)="DTMPC" K PK
 D:OO SET^%SGVAR("FOREGROUND",""),SET^%SGVAR("BACKGROUND","")
 D QSATTRI^%TXBPRIM(IND,OBJET,5,5,70,14)
 D:OO DEP^%SGVAR("FOREGROUND"),DEP^%SGVAR("BACKGROUND")
 S ^%PK($I)="DTCOLOR" K PK
 G MENU
MENU2 W /COLOR(@GG@(OBJET,"FOREGROUND"),@GG@(OBJET,"BACKGROUND"))
 G:x="" ESCA
 G @x
 
MOD D:OBJET="ARTICLE" DEFART^%TXBSAIS(ART)
 D:OBJET="FOURNISSEUR" DEFFRN^%TXBSAI2(FRN)
 D:OBJET="CONTRAT" DEFCONTR^%TXBSAI3(CNTRA)
 D:OBJET="COMMANDE" DEFCOMM^%TXBSAI4(COMM)
 D:OBJET="LIVRAISON" DEFLIVR^%TXBSAI5(LIVR)
 G MENU
 
 
AJ D AJ^%TXB2 G MENU
 
CONS D CONS^%TXB3 G MENU
 
SUP D SUPP^%TXB4 G MENU
 
 
 
MKMENU() N RES,MN,RES,ADRES,ATT,II
 S MN=$$TEMP^%SGUTIL
 S @MN=(NBC+1)_"^1^50"
 S @MN@(1)=$$^%QZCHW("consulter")_"^CONS"
 S @MN@(2)=$$^%QZCHW("modifier")_"^MOD"
 S @MN@(3)=$$^%QZCHW("ajouter")_"^AJ"
 S @MN@(4)=$$^%QZCHW("supprimer")_"^SUP"
 S @MN@(5)=$$^%QZCHW("editer")_"^EDIT"
 S II=6
 I '(FIXED("ARTICLE")) S @MN@(II)=$$^%QZCHW("article")_"^ART",II=II+1
 I '(FIXED("FOURNISSEUR")) S @MN@(II)=$$^%QZCHW("fournisseur")_"^FOURN",II=II+1
 I '(FIXED("CONTRAT")) S @MN@(II)=$$^%QZCHW("contrat")_"^CONTR",II=II+1
 I '(FIXED("COMMANDE")) S @MN@(II)=$$^%QZCHW("commande")_"^COMM",II=II+1
 I '(FIXED("LIVRAISON")) S @MN@(II)=$$^%QZCHW("livraison")_"^LIVR",II=II+1
 Q MN
 
 
 
ECHEC W /COLOR(7,6),/WOPEN(40,3,35,1,1,"","","","tc") D CUROF^%VVIDEO
 W "recherche epuisee [return]" R *zzz
 D CURON^%VVIDEO W /WCLOSE,/AA
 Q
BANIERE W /COLOR(7,6),/WOPEN(40,3,35,1,1,"","","","tc") D CUROF^%VVIDEO
 W " dkbms - achats a votre service " H 2
 D CURON^%VVIDEO W /WCLOSE,/AA
 Q
 
ENTETE W /COLOR(15,3),/WOPEN(0,0,78,1,"","","","","tc") D CUROF^%VVIDEO
 W $$^%QZCHW(" DKBMS - ACHATS a votre service ")
 Q
FENTETE W /WCLOSE Q
 
MINHLP D MES($$^%QZCHW(" taper sur une touche F1,F2,... ou ESC "))
 Q
 
SPEPRIX D MES($$^%QZCHW("specifiez l'article dont vous consultez les prix"))
 Q
MES(MES) 
 W /COLOR(7,6),/WOPEN(15,3,50,1,1,"","","","tc") D CUROF^%VVIDEO
 W MES H 2
 D CURON^%VVIDEO W /WCLOSE,/AA
 Q
MENKEY D shortwin^%funckey()
 D ^%funckey("article,fr/prix,fr,ctrat,cmde/ctr,livr,DKBMS,cde ss ctr")
 Q


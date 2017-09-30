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

;%QMEXLMO^INT^1^59547,73878^0
%QMEXLMO ;;05:52 PM  21 Oct 1992; ; 23 Nov 92 12:00 PM
 
 
 
 
 
 N ABENDSCR,RESUL,NO1,NO2,INDL,GL,AFF,I,%I,VAL,REPN,REPL,LIBC,LIBS,LIBM
 N SCR,MENU
 S REPN="ETAT.RESEAU",REPL=$$LIENI^%QSGEL3
 S LIBC=$$^%QZCHW("Consulter"),LIBS=$$^%QZCHW("Supprimer"),LIBM=$$^%QZCHW("Modifier")
 S MENU=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S @MENU="21^10^79"
 S @MENU@(1)=$$^%QZCHW("Consulter")_"^CONSULT"
 S @MENU@(1,"COM")=$$^%QZCHW("Consulter les conditions de transition")
 S @MENU@(2)=$$^%QZCHW("Modifier")_"^MODIF"
 S @MENU@(2,"COM")=$$^%QZCHW("Modifier les conditions de transition")
 S @MENU@(3)=$$^%QZCHW("Supprimer")_"^SUPP"
 S @MENU@(3,"COM")=$$^%QZCHW("Supprimer la transition")
 S SCR="QMEXLI2"
SP1 K RESUL S RESUL(3)=LIBC
SP2 D CLEPAG^%VVIDEO,AFF^%VACTGRQ("QMEXLI2",.RESUL)
 G:ABENDSCR FIN
 S NO1=$$GETLBLAN^%VTLBLAN(RESUL(1)),NO2=$$GETLBLAN^%VTLBLAN(RESUL(2))
 I (NO1="")&(NO2="") D PREMT G SP3
 D:NO2="" SECT
SP3 I (NO1="")!(NO2="") D ^%VSQUEAK G SP2
 S INDL=$$NOML^%QSGES20(ATN_","_NO1,ATN_","_NO2,"ETAT.PRECEDE",ATN_","_NO2)
 I INDL="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver l'individu lien correspondant...")) G SP1
MENU S DX=0,DY=22 D CLEBAS^%VVIDEO
MENU2 D ^%VQUIKMN(0,80,22,MENU,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") SP1
 G:ADRES'="" @ADRES G MENU2
 
CONSULT 
 I $$OAIR^%QSGE5(REPL,INDL,"PREDICAT",1) S Y1=$$VALEUR^%QSTRUC8(REPL,INDL,"PREDICAT",1) G CONS2
 I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Voulez-vous associer un predicat a cette transition ?"))) G MENU
 S Y1="" D POCLEPA^%VVIDEO W $$^%QZCHW("Predicat : ") S DX=$X,DY=$Y D ^%VLEC
 G:Y1="" MENU
 D PA^%QSGESTI(REPL,INDL,"PREDICAT",Y1,1)
CONS2 D ^%PSPRSA1(Y1,2,15)
 G MENU
 
MODIF 
 I $$OAIR^%QSGE5(REPL,INDL,"PREDICAT",1) S Y1=$$VALEUR^%QSTRUC8(REPL,INDL,"PREDICAT",1) G MOD
 I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Voulez-vous associer un predicat a cette transition ?"))) G MENU2
 S Y1="" D POCLEPA^%VVIDEO W $$^%QZCHW("Predicat : ") S DX=$X,DY=$Y D ^%VLEC
 G:Y1="" MENU2
 D PA^%QSGESTI(REPL,INDL,"PREDICAT",Y1,1)
MOD D ^%PSPRSA1(Y1,2,15)
 G MENU2
 
 
SUPP 
 D SUPS^%QSGEST3(REPN,ATN_","_NO1,"TRANSITION",REPN,ATN_","_NO2)
 G SP1
FIN K @(MENU)
 Q
 
 
 
 
 
 
UC1 N LNODE,N,%N
 S REFUSE=0
 S PARA=$$GETLBLAN^%VTLBLAN(RESUL(IC)),RESUL(IC)=PARA
 Q:RESUL(IC)=""
 I PARA'="?" G SUITUC1
 S N="" F %N=0:0 S N=$$NXTRIAO^%QSTRUC8("RESEAU",ATN,"ETAT.RESEAU",N) Q:N=""  S @LNODE@(N)=""
 S RESUL(IC)=$$^%QUCHOIX(LNODE,1,"",0,7,80,14)
 K @(LNODE)
 S:RESUL(IC)="" REFUSE=1 Q
SUITUC1 
 I '($$IR^%QSGEST5(REPN,ATN_","_PARA)) D ^%VZEAVT($$^%QZCHW("Noeud inexistant...")) S REFUSE=1
 Q
 
 
 
UC2 N NOM,O,%O,V
 S REFUSE=0
 I RESUL(1)="" D ^%VZEAVT($$^%QZCHW("Veuillez donner une valeur au 1er champ...")) S REFUSE=1 Q
 S PARA=$$GETLBLAN^%VTLBLAN(RESUL(IC)),RESUL(IC)=PARA
 Q:RESUL(IC)=""
 I PARA'="?" G SUITUC
 S NOM=$$TEMP^%SGUTIL
 S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8("ETAT.RESEAU",RESUL(1),"ETAT.PRECEDE",O) Q:O=""  S V=$$VALEUR^%QSTRUC8("ETAT.RESEAU",RESUL(1),"ETAT.PRECEDE",O),@NOM@(V)=""
 S RESUL(IC)=$$^%QUCHOIX(NOM,1,"",0,7,80,14),DX=0,DY=7 X XY D CLEBAS^%VVIDEO S:RESUL(IC)="" REFUSE=1
 K @(NOM)
 Q
SUITUC I '($$VAIR^%QSGE5(ETAT,ATN_","_RESUL(1),"ETAT.PRECEDE",ATN_","_PARA)) D ^%VZEAVT($$^%QZCHW("Transition inexistante entre ces 2 noeuds...")) S REFUSE=1
 Q
 
PREMT 
 S NO1=$$NXTRIAO^%QSTRUC8("RESEAU",ATN,"ETAT.RESEAU",NO1)
 Q:NO1=""
 G:'($$AIR^%QSGEST5("ETAT.RESEAU",ATN_","_NO1,"ETAT.PRECEDE")) PREMT
 S NO2=$$NXTRIAV^%QSTRUC8("ETAT.RESEAU",ATN_","_NO1,"ETAT.PRECEDE","")
 S NO2=$P(NO2,",",2)
 S RESUL(1)=NO1,RESUL(2)=NO2
 D ^%VAFISCR
 Q
 
 
 
 
SECT 
 G:'($$AIR^%QSGEST5("ETAT.RESEAU",ATN_","_NO1,"ETAT.PRECEDE")) PREMT
 S NO2=$$NXTRIAV^%QSTRUC8("ETAT.RESEAU",ATN_","_NO1,"ETAT.PRECEDE","")
 S NO2=$P(NO2,",",2)
 S RESUL(2)=NO2
 D ^%VAFISCR
 Q
 ;


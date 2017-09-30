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

;%TXRDVS^INT^1^59547,74033^0
%TXRDVS ;
 
 
 
 
 N %DN,DAAT,DATF,DATD,DT,HHD,HHF,DSEM,DP,HRDV,DXINI,HHC,TAD,DAY,HRD,HC
 N REFUSE,MSG,DEP,PX,PY,WEN,LA,NXI,NXS,NYI,NYS,MPASX,MPASY
 N NAME,X1,CONNECT,TRDV,NRDV,CTRLA,CTRLE,CTRLF,CTRLL,CTRLP,CTRLR
 N X2,X3
 
 S NAME="",TEMPORAI="TEMPORAI($j)"
DEB D CLEPAG^%VVIDEO
DEBPOST ;;
 S WEN=0,DX=0,DY=0,DP=6,DEP=0 X XY
 S %POSTE=$$^%VZAME1($$^%QZCHW("Poste d'activite")_" : ") Q:(CTRLA=1)!(CTRLF=1)
 G:%POSTE="" DEB
DEBSE ;;
 S WEN=0,DX=0,DY=2,DP=6,DEP=0 X XY
 S DAAT=$$^%VZAME1($$^%QZCHW("Semaine du")_" : ") G:(CTRLA=1)!(CTRLF=1) DEBPOST
 S DAAT=$$CORRECT^%VYDAT(DAAT) G:DAAT="" DEBSE
 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Semaine du")_" : "_DAAT_$J("",15)_$$^%QZCHW("Activites de")_$J("",15)_%POSTE,0)
 D ^%TXINDH
AFFICH 
 K %RESERVE
 D GRILLE^%TXAFFS,OCCUPE^%TXAFFS
 D MENU(.TEMPORAI)
AFCOM 
 S CTRLA=0,CTRLF=0,DX=$S(WEN=1:LA,1:10),DY=$S(WEN=1:PY,1:3+(DXINI*2)),WEN=0,NXI=9,NXS=57,NYI=2,NYS=16,(MPASX,MPASY)=2 X XY
 
ACT 
 D ^%VZECUR S %KEEP("DX")=DX,%KEEP("DY")=DY,%KEEP("DP")=DP,%KEEP("DSEM")=DSEM
DIAL D ^%VQUIKMN(0,80,22,TEMPORAI,.AD,.CONTR)
 G:(CONTR="A")!(CONTR="F") ENDACT
 I AD'="" G @AD
 G DIAL
 G:(DEP=1)&((((((X1=63)!(X1=65))!(X1=83))!(X1=76))!(X1=73))!(X1=18)) ACT I ((((((((((((((X1'=43)&(X1'=45))&(X1'=65))&(X1'=1))&(X1'=63))&(X1'=68))&(X1'=83))&(X1'=91))&(X1'=93))&(X1'=61))&(X1'=76))&(X1'=73))&(X1'=77))&(X1'=67))&(X1'=18) D ^%VSQUEAK G ACT
 G @X1
43 
 I DP>16 D ^%VSQUEAK G ACT
 S DP=DP+6 G AFFICH
61 G 43
76 
 D ^%TXLISR G DEB+4
77 
 D ^%TXODRV
 S DX=0,DY=17 D CLEBAS^%VVIDEO G AFCOM
45 
 I DP<6 D ^%VSQUEAK G ACT
 S DP=DP-6 G AFFICH
65 
 S DX=%KEEP("DX"),DY=%KEEP("DY"),DP=%KEEP("DP"),DSEM=%KEEP("DSEM")
 D ^%TXAJRV
 S DY=17,WEN=1,HHC=HRDV
 D POS^%TXINDH S LA=PX+2 D CLEBAS^%VVIDEO G AFCOM
1 
 I DEP=1 S DEP=0,DX=35,DY=1 X XY W $J("",12) G AFCOM
 G DEB
18 
 G AFFICH
63 
 D HRV^%TXINDH
 S DY=17 D CLEBAS^%VVIDEO,LISRDV^%TXAFFS,^%VZEAVT("")
 S DY=17,WEN=1,LA=$S(PX=56:PX,1:PX+2) D CLEBAS^%VVIDEO G AFCOM
68 
 G:DEP=1 681
 K NAME D ^%TXDEPL
 S DX=0,DY=17 D CLEBAS^%VVIDEO
 I DEP=1 S DX=35,DY=1 D BLK^%VVIDEO,BLD^%VVIDEO X XY W "DEPLACEMENT" D NORM^%VVIDEO
 S DX=10,DY=3,NXI=8,NXS=57,NYI=2,NYS=16,(MPASX,MPASY)=2
 G AFCOM
681 D DEPL^%TXDEPL
 S DX=PX,DY=PY D REV^%VVIDEO X XY W ^[QUI]OCCUPE(DP,DSEM,PY,PX) D NORM^%VVIDEO
 G AFFICH,AFCOM
83 
 D ^%TXSUPR G:NAME="RESERVE" AFFICH G AFCOM
91 
 S %DN=DSEM+7 D GETDAT^%TXINDH S DAAT=DT G DEB+4
93 
 S %DN=DSEM-7 D GETDAT^%TXINDH S DAAT=DT G DEB+4
73 
 D ^%TXAJLI
 S CONNECT=0,DX=0,DY=17 D CLEBAS^%VVIDEO G AFCOM
67 
 D ^%TXCONS S CONNECT=0 G DEB+4
 ;;
MENU(TTLM) 
MENUT N I
 S @TTLM="21^10^79"
 S @TTLM@(1)=$$^%QZCHW("Ajouter")_"^65"
 S @TTLM@(1,"COM")=$$^%QZCHW("Creer ou inserer une activite")
 S @TTLM@(2)=$$^%QZCHW("Modifier")_"^77"
 S @TTLM@(2,"COM")=$$^%QZCHW("Modifier une activite")
 S @TTLM@(3)=$$^%QZCHW("Supprimer")_"^83"
 S @TTLM@(3,"COM")=$$^%QZCHW("Supprimer une activite")
 S @TTLM@(4)=$$^%QZCHW("Deplacer")_"^68"
 S @TTLM@(4,"COM")=$$^%QZCHW("Deplacer une activite")
 S @TTLM@(5)=$$^%QZCHW("Examiner")_"^63"
 S @TTLM@(5,"COM")=$$^%QZCHW("Acceder au dossier de cette activite")
 S @TTLM@(6)=$$^%QZCHW("lister")_"^76"
 S @TTLM@(6,"COM")=$$^%QZCHW("lister les activites")
 S @TTLM@(7)=$$^%QZCHW("ial")_"^IMPRIM"
 S @TTLM@(7,"COM")=$$^%QZCHW("inserer une activite libre")
 S @TTLM@(8)=$$^%QZCHW("cal")_"^DUPLI"
 S @TTLM@(8,"COM")=$$^%QZCHW("c/m/s d'une activite libre")
 S @TTLM@(9)=$$^%QZCHW("cloture ")_"^SUBST"
 S @TTLM@(9,"COM")=$$^%QZCHW("cloture des activites d'une journee")
 S @TTLM@(10,"COM")=$$^%QZCHW("reporter les activites non cloturees")
 S @TTLM@(10)=$$^%QZCHW("Report")_"^RECH"
 S @TTLM@(11)="+^43",@TTLM@(11,"EQU")="="
 S @TTLM@(11,"COM")=$$^%QZCHW("Plage suivante")
 S @TTLM@(12)="-^45",@TTLM@(12,"EQU")="_"
 S @TTLM@(12,"COM")=$$^%QZCHW("Plage precedente")
 S @TTLM@(13)="[^91",@TTLM@(13,"EQU")="("
 S @TTLM@(13,"COM")=$$^%QZCHW("Semaine suivante")
 S @TTLM@(14)="]^93",@TTLM@(14,"EQU")=")"
 S @TTLM@(14,"COM")=$$^%QZCHW("Semaine precedente")
 S @TTLM@(15)=$$^%QZCHW("presentation")_"^67"
 S @TTLM@(15,"COM")=$$^%QZCHW("presentation des activites successives")
 Q


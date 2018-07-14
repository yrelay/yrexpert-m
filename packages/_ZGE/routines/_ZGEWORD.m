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
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%ZGEWORD^INT^1^59547,74037^0
ZGEWORD ;
 
S S $ZT="",%P=16,EDOV=0,EDSL=19,%ALM=0,(EDBB,EDBE,EDST,EDS2,EDDC,EDDW,EDDL)="",$P(%ED,"^",1)=%EDE D INT^%MAXSIZ,INIT^%ZGEINSF W @(FF) D LOAD
ED D SET^%ZGEINSF,^%ZGEED
 K PGM,%ALM,%SEP,%EDE,%EDI,X,ED,EDBB,EDBE,EDL,EDOV,EDP,EDPP,EDR,EDRP,EDS,EDS2,EDSL,EDST,EDFL,EDCL,EDLL,EDN,WORS,EDDC,EDDW,EDDL D Q^%ZGEINSF Q
 
 
LOAD S WORS=0 G LE:PGM=EMP S DX=0,DY=EDSL+2 X XY W "Reading ",PGM X XL
 I '(%F) F Y=0,1 S ^U($J,"P",Y)=$P($T(0+Y),";;",2,999)
 I %F F Y=0,1 S ^U($J,"P",Y)=$P($T(FIC0+Y),";;",2,999)
 X ^U($J,"P",0) K Y W " (OK)"
LE D STAT Q
 
 
SAV D:PGM=EMP FILE Q:PGM=EMP  S DX=0,DY=EDSL+2,WORS=0
 X XY W "Saving ",PGM X XL
 I '(%F) F Y=0:1:2 S ^U($J,"P",Y)=$P($T(1+Y),";;",2,999)
 I %F F Y=0:1:2 S ^U($J,"P",Y)=$P($T(FIC1+Y),";;",2,999)
 K (RM,EDP,EDRP,EDL,ED,EDS,EDCL,EDLL,WORS,PGM,%P,EDOV,EDSL,EDBB,EDBE,EDST,EDS2,EDDC,EDDW,EDDL,%ED,%EDE,%EDI,%F)
 X ^U($J,"P",0) W " (OK)" D INIT^%ZGEINSF,SET^%ZGEINSF,STAT Q
 
FILE S %SAVE="X;%ED" D PUSH^%ZGESTK S $P(%ED,U,1)=$S($D(%EDI):%EDI,1:11) D SET^%ZGEINSF S %Q="File name? ",X=PGM D ^%ZGEIN S PGM=$S(%C:EMP,1:X),WORS=EMP D POP^%ZGESTK,SET^%ZGEINSF,STAT Q
STAT S %ALM=0,$P(%ED,U,3)=$P(^%ZGE("C",+(%ED),0),U,1)_" *** File "_PGM_" "_$S(WORS:"("_WORS_" bytes)",1:EMP)_" *** "_$S(EDOV:"Overstrike",1:EMP)
 S DX=0,DY=EDSL+1 X XY W $E(%SEP,1,RM) D INT^%DIR,REV^%VVIDEO,BLD^%VVIDEO S MSG=" Vous etes sur la partition "_%DIR_" ",DX=(RM-$L(MSG))\2 X XY W MSG D NORM^%VVIDEO
 S DY=EDSL+4 X XY W $E($P(%ED,U,3),1,RM) X XL Q
 
 
0 ;;ZL @PGM K ^U($J,0) X ^U($J,"P",1) K %I
 ;;F %I=1:1 S X=$T(+%I) Q:X=""  S WORS=WORS+$L(X),^U($J,0,%I)=$S($L(X)<245:$P(X," ",1)_$J(EMP,6-$L($P(X," ",1)))_" "_$P(X," ",2,999),1:X) S ^(%I,0)=%I-1
 
 
FIC0 ;;K ^U($J,0) D OPENFILE^%SYSUTI1(PGM,"R",.%J,.%OK) X:%OK ^U($J,"P",1) K %I,%J,%K,%OK
 ;;F %I=1:1 S %X=$$READ^%SYSUTI1(%J,.%OK) D:'%OK CLOSE^%SYSUTI1(%J,"R") Q:'%OK  S ^U($J,0,%I)=%X S ^(%I,0)=%I-1
 
 
1 ;;D INTT^%QMDAUTI ZR  S %I=1,%=^U($J,0,%I),X=$P(%," ",1) S:'$L(%) %=" "_% X ^U($J,"P",2) S %BB=$P(%," ;",1,2)_" ; "_$ZD($H,2)_" "_%TIM ZI %BB X ^U($J,"P",1) K %AA,%BB,%TIM ZS @PGM D ^%ZGEPROG K %I,%0,%1
 ;;F %I=1:0 S %I=$O(^U($J,0,%I)) Q:'%I  S %=^(%I),X=$P(%," ",1) S:'$L(%) %=" "_% X ^U($J,"P",2) S %=$TR(%,$C(0),"") ZI % S WORS=WORS+$L(%) K %,X
 ;;S %0=$P(%," ",2,999) F %1=0:0 S:$E(%0)=" " %0=$E(%0,2,999) I $E(%0)'=" " S %=$P(%," ",1)_" "_%0 K %0,%1 Q
 
 
FIC1 ;;D OPENFILE^%SYSUTI1(PGM,"W",.%J,.%OK) X:%OK ^U($J,"P",1) D:%OK CLOSE^%SYSUTI1(%J,"W") K %I,%J,%K,%OK,%AA,%BB,%TIM
 ;;F %I=0:0 S %I=$O(^U($J,0,%I)) Q:'%I  S %=^(%I) D WRITE^%SYSUTI1(%J,%)
 ;;


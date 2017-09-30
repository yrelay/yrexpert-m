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

;%TLOPTF1^INT^1^59547,74030^0
%TLOPTF1 ;;06:45 PM  17 Nov 1993; ; 17 Nov 93  6:27 PM
 
 
 
 
 
 
 
 
SINUS(IDEB,NBREG) 
 N RES
 S RES=$$SIN^%TLCAMTH(V(IDEB))
 Q RES
 
 
 
 
 
 
 
 
 
 
 
 
 
 
VARUSER(IDEB,NBREG) 
 N RES,NB
 I (V(IDEB)+0)=V(IDEB) S RES=$$VARUSER^%TLCAMTH(V(IDEB)) Q RES
 I '($D(^[QUI]UTIL(V(IDEB)))) Q ""
 S NB=$P(^[QUI]UTIL(V(IDEB)),"^")
 S RES=""
 Q:NBREG=1 "" Q:V(IDEB+1)=$C(0) ""
 I NB=1 Q $S($D(^[QUI]UTIL(V(IDEB),"V",V(IDEB+1)))#10:^[QUI]UTIL(V(IDEB),"V",V(IDEB+1)),1:"")
 Q:NBREG=2 "" Q:V(IDEB+2)=$C(0) ""
 I NB=2 Q $S($D(^[QUI]UTIL(V(IDEB),"V",V(IDEB+1),V(IDEB+2)))#10:^[QUI]UTIL(V(IDEB),"V",V(IDEB+1),V(IDEB+2)),1:"")
 Q:NBREG=3 "" Q:V(IDEB+3)=$C(0) ""
 I NB=3 Q $S($D(^[QUI]UTIL(V(IDEB),"V",V(IDEB+1),V(IDEB+2),V(IDEB+3)))#10:^[QUI]UTIL(V(IDEB),"V",V(IDEB+1),V(IDEB+2),V(IDEB+3)),1:"")
 Q ""
 
 
INFOUSER(IDEB,NBREG) 
 N RES,NB
 I '($D(^[QUI]UTIL(V(IDEB)))) Q ""
 S NB=$P(^[QUI]UTIL(V(IDEB)),"^")
 I NB=0 Q $S($D(^[QUI]UTIL(V(IDEB),"V"))#10:^[QUI]UTIL(V(IDEB),"V"),1:"")
 Q:NBREG=1 "" Q:V(IDEB+1)=$C(0) ""
 I NB=1 Q $S($D(^[QUI]UTIL(V(IDEB),"V",V(IDEB+1)))#10:^[QUI]UTIL(V(IDEB),"V",V(IDEB+1)),1:"")
 Q:NBREG=2 "" Q:V(IDEB+2)=$C(0) ""
 I NB=2 Q $S($D(^[QUI]UTIL(V(IDEB),"V",V(IDEB+1),V(IDEB+2)))#10:^[QUI]UTIL(V(IDEB),"V",V(IDEB+1),V(IDEB+2)),1:"")
 Q:NBREG=3 "" Q:V(IDEB+3)=$C(0) ""
 I NB=3 Q $S($D(^[QUI]UTIL(V(IDEB),"V",V(IDEB+1),V(IDEB+2),V(IDEB+3)))#10:^[QUI]UTIL(V(IDEB),"V",V(IDEB+1),V(IDEB+2),V(IDEB+3)),1:"")
 Q ""
 
 
 
 
 
 
 
 
COTANG(IDEB,NBREG) 
 N RES
 S RES=$$COTG^%TLCAMTH(V(IDEB))
 Q RES
 
 
 
 
 
 
 
 
ARCTANG(IDEB,NBREG) 
 N RES
 S RES=$$ARCTG^%TLCAMTH(V(IDEB))
 Q RES
 
 
 
 
 
 
 
 
 
 
ARRONDIR(IDEB,NBREG) 
 N RES,VAL1,VAL2,VAL3,RESTE,PUIS
 S VAL1=V(IDEB)+0,VAL2=V(IDEB+1),VAL3=$S(NBREG=2:$C(0),1:V(IDEB+2))
 S RESTE=$E($P(VAL1,".",2),VAL2+1)
 I RESTE="" Q VAL1
 S RES=$$ARRND^%TLCAMTH(VAL1,VAL2)
 I VAL3=$C(0) Q RES
 S PUIS=$$PUIS^%TLCAMTH(1E-1,VAL2)
 I (VAL3=0)&(RESTE>4) S RES=RES-PUIS
 I (VAL3=1)&(RESTE<5) S RES=RES+PUIS
 Q RES
 
 
 
 
 
 
 
 
LN(IDEB,NBREG) 
 N RES
 S RES=$$LN^%TLCAMTH(V(IDEB))
 Q RES
 
 
 
 
 
 
 
 
 
 
LOG(IDEB,NBREG) 
 N RES
 S RES=$$LOGBN^%TLCAMTH(V(IDEB),V(IDEB+1))
 Q RES
 
 
 
 
 
 
 
 
 
 
PUISSANC(IDEB,NBREG) 
 N RES
 S RES=$$PUIS^%TLCAMTH(V(IDEB),V(IDEB+1))
 Q RES
 
 
 
 
 
 
 
 
 
MIN(IDEB,NBREG) 
 N RES,NB
 S RES=V(IDEB),NB=NBREG-1
 F I=1:1:NB S:V(IDEB+I)<RES RES=V(IDEB+I)
 Q RES
 
 
 
 
 
 
 
 
 
MAX(IDEB,NBREG) 
 N RES,NB
 S RES=V(IDEB),NB=NBREG-1
 F I=1:1:NB S:V(IDEB+I)>RES RES=V(IDEB+I)
 Q RES
 
 
 
 
 
 
 
 
 
 
 
MINOR(IDEB,NBREG) 
 N RES,NB,I,J
 S RES=V(IDEB),NB=NBREG-1
 F I=1:1:NB I V(IDEB+I)<RES S RES=V(IDEB+1) Q
 F J=I:1:NB I (V(IDEB+J)>RES)&(V(IDEB+J)'>V(IDEB)) S RES=V(IDEB+J)
 Q RES
 ;


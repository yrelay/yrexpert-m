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

;%SYSCARU^INT^1^59547,73892^0
SY3CARU ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CPU(J) 
 N j,ja
 S j=J
 S ja=$V(1,((j-1)*2)+100,-2)*16 Q:ja=0 -1
 Q $V(0,ja+354,-4)
 
 
 
EXISTE(J) 
 N j,ja
 S j=J
 S ja=$V(1,((j-1)*2)+100,-2)*16
 Q ja'=0
 
 
 
STOP(J) 
 N j
 S j=J
 D terminate^%mjob1
 Q
 
 
FORK(ROUT,SYMB,IDEV,ODEV,TIMOUT) 
 N X,NOFORK,DEVI
 S NOFORK=0
 S DEVI=$$GETDEV Q:DEVI=-1 0
 S X=" J "_ROUT_":(PDEV="_DEVI_")"
 S $ZT="G ERFORK^%SYSCARU"
 X X
 S $ZT=""
 Q 1-NOFORK
ERFORK S $ZT="" Q 0
 
GETDEV() 
 N IOD,CPT,I
 S CPT=1
 F I=0:0 F IOD=2:1:9 I IOD'=$I G:$$OKDEV(IOD) FINGET S CPT=CPT+1 G:CPT=50 FINGET
FINGET Q:CPT=50 0 Q IOD
OKDEV(IOD) 
 O IOD::0 E  Q 0
 C IOD Q 1
 
CURRENT N %A
 I $D(^%IS($I,1)) S %A=^(1),%A=$P(%A,"^",3) I %A]"",$D(^%IS(0,"SUB",%A)),(^(%A))]"" S SUB=%A,%A=^(%A),FF=$P(%A,"^",2),RM=+(%A),SL=$P(%A,"^",3),BS=$P(%A,"^",4),XY=$P(%A,"^",5)
 E  S FF="#",SL=24,BS="*8",RM=80,SUB="",XY="",ZFF=$C(12),ZBS=$C(8)_" "_$C(8)
 Q


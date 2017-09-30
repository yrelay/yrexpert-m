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

;%LXSTOCK^INT^1^59547,73871^0
LEXSTOCK ;
 
 
 
 
LISTE(LISTE) 
 G L
 
 
 
 
 
MOT(MOT) 
 G M
 
 
 
 
 
EXIST(MOT) 
 Q:$E(MOT,1,1)="%" 1 Q $D(^[QUI]TOLEX(MOT))'=0
 
 
 
 
 
DELIST(LISTE) 
 G DL
 
 
 
 
 
DEL(MOT) 
 G D
 
 
 
 
 
LEX(S,D) 
 G LE
 
 
 
 
 
 
 
 
 
LEXIQ(ROUTAFF) 
 G EXT^%LXIQ
 
 
 
 
 
 
 
 
LE K D N CONCUR,PCH,PCHCOMP,CH
 S PCH=S D ^%LXABR
 Q:CONCUR=0 0 I CONCUR=1 S D=PCHCOMP Q 1
 Q:CONCUR>1 2 Q 0
 
 
L N MOT,%M
 S MOT=-1 F %M=0:0 S MOT=$N(@LISTE@(MOT)) Q:MOT=-1  D M
 Q
 
 
M N (QUI,XY,WHOIS,MOT)
 Q:$$EXIST(MOT)
 S (COM1,COM2,COM3,COM4,COM5,UNI,ABUNIT,LSYNO)=""
 G STOCK2^%LXAJMOD
 
 
DL N MOT,%M
 S MOT=-1 F %M=0:0 S MOT=$N(@LISTE@(MOT)) Q:MOT=-1  D D
 Q
 
 
D Q:'($$EXIST(MOT))
 N (QUI,XY,WHOIS,MOT)
 S RES=$$SUPP^%LXSUPP(MOT)
 Q
 
 
AS(MOT,MOTS) 
 Q:'($$EXIST(MOT))
 N (QUI,XY,WHOIS,MOT,MOTS)
 S NOMTAB="^[QUI]TOLEXS",ABENDSCR=0,SCR="LEXISYN",RESUL(1)=MOT
 S RESUL(2)=MOTS
 D ^%VAUTOST,STO5^%LXAJMOD,STO4^%LXAJMOD Q
 
 
 
AC(MOT,RESUL) 
 Q:'($$EXIST(MOT))
 N CH,I,CH2
 S CH2=^[QUI]TOLEX(MOT),CH2=$P(CH2,"^",6,99)
 S CH=""
 F I=2:1:6 S CH=CH_$S(($D(RESUL(I))#10)=1:RESUL(I),1:"")_"^"
 
 S ^[QUI]TOLEX(MOT)=CH_CH2
 Q
 
 
 
COPY(WHOIS1,QUI1,MOT1,WHOIS2,QUI2,MOT2) 
 N QUI,I,SYN,WHOIS,PH,COM1,COM2,COM3,COM4,COM5,UNI,ABUNIT
 S WHOIS=WHOIS2
 
 I $$RESERVE^%LXUCRES(QUI1,MOT1) Q
 I $$RESERVE^%LXUCRES(QUI2,MOT2) Q
 S QUI=QUI2 D DEL(MOT2)
 
 S PH=^[QUI1]TOLEX(MOT1)
 S COM1=$P(PH,"^",1),COM2=$P(PH,"^",2)
 S COM3=$P(PH,"^",3),COM4=$P(PH,"^",4)
 S COM5=$P(PH,"^",5)
 
 S SYN="^[QUI1]TOLEXS(MOT1)"
 
 
 S UNI=$P(PH,"^",6),ABUNIT=$P(PH,"^",7)
 
 D STOCK^%LXAJMOD(MOT2,COM1,COM2,COM3,COM4,COM5,UNI,ABUNIT,SYN)
 Q
 
 
UNIT(MOT) 
 
 N UNI
 S UNI=$O(^[QUI]TOLEXU(MOT,"")) Q:UNI="" ""
 Q $P(^[QUI]TOLEXU(MOT,UNI),"^")
 
 
COMM(MOT) 
 N COMM,I
 
 
 F I=1:1:4 S COMM=$P(^[QUI]TOLEX(MOT),"^",I) Q:COMM'=""
 Q COMM


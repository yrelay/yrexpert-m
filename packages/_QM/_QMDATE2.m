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

;%QMDATE2^INT^1^59547,73877^0
ZHEUR2(A) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N SEM,I,HH,DAT,AN,DATF
 Q:$D(^SEMAINE(A))
 F I=1:1:53 D TRAIT
 Q
TRAIT S SEM=A_I
 S HH=$$HLUN^%QMDAK4(SEM),DAT=$$01^%QMDATE1(HH),AN=$$AS(DAT)
 Q:(AN'=A)&(I'=1)
 S MOIS=$$MS(DAT)
 D:(I=1)&(MOIS=1) DEBUT
 S:(MOIS=12)&(I=1) MOIS=1 S ^SEMAINE(A,MOIS,I)=""
 D BOUCLE
 Q
BOUCLE Q:MOIS=12
 S H=HH+7,DATF=$$01^%QMDATE1(H)
 Q:$$MS(DATF)=MOIS  Q:$$JMS(DATF)=1  S ^SEMAINE(A,$$MS(DATF),I)=""
 Q
 
DEBUT S SEM=(A-1)_53,H53=$$HLUN^%QMDAK4(SEM),DAT53=$$01^%QMDATE1(H53)
 S AN53=$$AS(DAT53),M53=$$MS(DAT53)
 G:(AN53'=(A-1))!(M53'=12) DEB52
 S H=H53+7,DATF=$$01^%QMDATE1(H) Q:$$MS(DATF)=12  Q:$$JMS(DATF)=1
 S ^SEMAINE(A,1,53)="" Q
 
DEB52 S SEM=(A-1)_52,H52=$$HLUN^%QMDAK4(SEM),DAT52=$$01^%QMDATE1(H52)
 S H=H52+7,DATF=$$01^%QMDATE1(H) Q:$$MS(DATF)=12  Q:$$JMS(DATF)=1
 S ^SEMAINE(A,1,52)="" Q
 
AS(DAT) Q $P(DAT,"/",3)
 
MS(DAT) S M=$P(DAT,"/",2) S:M["0" M=M*1
 Q M
 
JMS(DAT) 
 S J=$P(DAT,"/",1) S:J["0" J=J*1 Q J
 
 
DATET(FORMAT,DATSAI,FORMDAT) 
 N RES,VAL
 I (FORMAT="")&(DATSAI="") S RES=$$DATE^%QMDATE G DATETF
 
 I '($D(^RQSGLU("QMDA","FORM",FORMAT))) Q ""
 I DATSAI="" S VAL=$H_"/"_($H+1) G DATET2
 I FORMDAT'="" G DATET3
 I '($$^%QMDASAI(DATSAI,.VAL)) Q ""
DATET2 S RES=$$^%QMDAFFI(VAL,FORMAT)
 
DATETF Q RES
 
DATET3 
 I '($D(^RQSGLU("QMDA","FORM",FORMDAT))) Q ""
 S VAL=$$^%QMDAINT(DATSAI,FORMDAT)
 I VAL="" Q ""
 G DATET2


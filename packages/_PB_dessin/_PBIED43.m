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

;%PBIED43^INT^1^59547,73873^0
PTIGDX43 ;
 N ATT,I,J,M,N,PAR,R,S,SN,SY,X,Y
 S J=2 F I="X","Y","M","S","N" S @I=$P(CH,"^",J),J=J+1
 D ^%PBPZALF G:M="" OK G @M
 
1 N L,PA,PD,T,XD,YD
 S SY(1)="(*/*;X;X)",R=$$^%PBIANSY(.SY,S,.ATT,.PAR,.SN),PD=PAR(3),PA=PAR(4)
 S L=$$VAL^%PBIED4(NBASE,NIND,PAR(1),ME,.STOP) Q:(L="")!STOP
 S T=$$VAL^%PBIED4(NBASE,NIND,PAR(2),1000,.STOP) Q:(T="")!STOP
 I '($D(POINT(PD))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Point encore jamais vu : ",PD," [RETURN]" R *R:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO Q
 S I=POINT(PD),XD=$P(I,"^",1),YD=$P(I,"^",2)
 D NEWP^%PBCACV(XD,YD,L,T,.X,.Y) G OK
 
2 N PA,PC,PD,RA,XA,XD,YA,YD
 S SY(1)="(X;X/R=*;X)",R=$$^%PBIANSY(.SY,S,.ATT,.PAR,.SN)
 S PD=PAR(1),PA=PAR(2),PC=PAR(4)
 I '($D(POINT(PD))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Point encore jamais vu : ",PD," [RETURN]" R *R:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO Q
 S I=POINT(PD),XD=$P(I,"^",1),YD=$P(I,"^",2)
 I '($D(POINT(PA))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Point encore jamais vu : ",PA," [RETURN]" R *R:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO Q
 S RA=$$VAL^%PBIED4(NBASE,NIND,PAR(3),ME) Q:(RA="")!STOP
 S I=POINT(PA),XA=$P(I,"^",1),YA=$P(I,"^",2)
 D ARCR^%PBCACV(XD,YD,XA,YA,RA,.X,.Y) G OK
 
3 N AN,PA,PC,PD,XC,XD,YC,YD
 S SY(1)="(X;X/A=*;X)",R=$$^%PBIANSY(.SY,S,.ATT,.PAR,.SN)
 S PC=PAR(1),PD=PAR(2),PA=PAR(4)
 I '($D(POINT(PC))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Point encore jamais vu : ",PC," [RETURN]" R *R:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO Q
 S I=POINT(PC),XC=$P(I,"^",1),YC=$P(I,"^",2)
 I '($D(POINT(PD))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Point encore jamais vu : ",PD," [RETURN]" R *R:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO Q
 S AN=$$VAL^%PBIED4(NBASE,NIND,PAR(3),1000) Q:(AN="")!STOP
 S I=POINT(PD),XD=$P(I,"^",1),YD=$P(I,"^",2)
 D ROTP^%PBCACV(XC,YC,XD,YD,AN,.X,.Y) G OK
 
OK S:N'="" POINT(N)=X_"^"_Y
 D:AFF ^%PBPZGRA,CALXY^%PBCACV(X,Y,XT,YT,ROT,AGR,.X,.Y),POINT^%PBMFN(X,Y,0)
 S:(N'="")&(PTS'="") @PTS@(OBJET,N)=X_"^"_Y Q


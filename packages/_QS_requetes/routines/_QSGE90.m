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

;%QSGE90^INT^1^59547,73881^0
%QSGE90 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
OVLIR(R,I,L,V,O) 
 N A,QA,QR,RD,T,LR,LL,NILA,LIENI,B,VD,OD,OKK
 
 
 
 S A=$$OVLIR^%QSGE9(R,I,L,V,O)
 
 Q:(A'=0)&(A'=1) A
 Q:A=0 A
 
 S QA=$$QUAL^%QSGEL2(R,L)
 S RD=$$REPD^%QSGEL2(R,L)
 S T=$$TYPE^%QSGEST9(R,L)
 S LR=$$LIENI^%QSGEL2(R,RD,L,T)
 S QR=$$QUAL^%QSGEL2(RD,LR)
 
 Q:(QA=0)&(QR=0) A
 
 S ID=V
 S VD=I
 I (T'=1)&(T'=2) D CAL1^%QSGEST3(R,I,L,RD,ID,O,.OD,.OKK) I '(OKK) Q -3
 
 I T=2 S ID=$$NOMFILS^%QSGES10(R,I,RD,V),OD=1
 I T=1 S VD=$$NOMEX^%QSGES10(R,I),OD=$$NXTRIAVO^%QSTRUC8(RD,ID,LR,VD,"")
 
 I QA=1 S A=$$DLIEN(R,I,L,V,O,RD,ID) I A'=1 Q A
 I QR=1 S B=$$DLIEN(RD,ID,LR,VD,OD,R,I) I B'=1 Q B
 Q 1
 
 
DLIEN(R,I,L,V,O,RD,ID) 
 N A,LL,NILA,LIENI,LI
 
 S LL=$$NLIENL(L)
 S LI=$$NLIENI(L)
 S NILA=$$NOML1^%QSGES20(I,O,L,ID)
 I NILA="" Q -4
 S A=$$OVLIR^%QSGE9(R,I,LL,NILA,NILA)
 
 I A'=1 Q -6
 
 S LIENI=$$LIENI^%QSGEL3
 Q:'($$ILIEN(LIENI,NILA,R,RD,O,L)) -5
 S A=$$OVLIR^%QSGE9(RD,ID,LI,NILA,NILA)
 
 I A'=1 Q -6
 Q 1
 
NLIENL(L) 
 Q "LIEN."_L
 
NLIENI(L) 
 Q "INVERSE."_L
 
NILA(R,I,L) Q $$^%QSCALVA(R,I,L,"")
 
 
 
 
 
 
 
 
ILIEN(R,L,RS,RD,O,NAL) 
 
 N LLIENS,I,LIEN,LLIENS1,SL,DL
 S LLIENS="LLIENS1"
 Q:'($$ONEVAL(R,L,"NOM",1,L)) 0
 
 Q:'($$ONEVAL(R,L,"REP.SOURCE",1,$$NOMLOG^%QSF(RS))) 0
 Q:'($$ONEVAL(R,L,"REP.DESTINATION",1,$$NOMLOG^%QSF(RD))) 0
 Q:'($$ONEVAL(R,L,"NUMERO.ORDRE",1,O)) 0
 Q:'($$ONEVAL(R,L,"NOM.LIEN",1,NAL)) 0
 
 S SL="SOURCE."_NAL
 S DL="DESTINATION."_NAL
 D LIENS^%QSGEST9(R,L,LLIENS)
 S LIEN=$O(@LLIENS@(""))
 F I=0:0 Q:LIEN=""  Q:$$LLIEN  S LIEN=$O(@LLIENS@(LIEN))
 
 I LIEN'="" Q 0
 Q 1
LLIEN() 
 I (LIEN=SL)!(LIEN=DL) Q:$O(@LLIENS@(LIEN,$O(@LLIENS@(LIEN,""))))'="" 1 Q 0
 
 Q:$O(@LLIENS@(LIEN,""))'="" 1
 Q 0
 
 
 
ONEVAL(R,I,ATT,ORDRE,VAL) 
 N NOM,TYPE
 S NOM=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOM") K @(NOM)
 D MVG^%QSCALVA(R,I,ATT,NOM,.TYPE)
 I (($O(@NOM@(""))'=ORDRE)!($O(@NOM@(ORDRE))'=""))!($D(@NOM@(ORDRE))'=1) K @(NOM) Q 0
 Q @NOM@(ORDRE)=VAL
 
TEST X ^ELC
 W !,$$OVLIR("ARTICLE","0311.064.00004","COMPOSANT.DE","3911.623.04861","3911.623.04861")
TEST1 X ^ACM
 W !,$$OVLIR("MOZ","1,45ED","OPERATION.MOZART","TORONNAGE/10.001",10001E-3)
TEST2 W !,$$OVLIR("MOZOP","1,45ED,TORONNAGE/10.001","GAMME","1,45ED",1)
TEST3 W !,$$OVLIR("ARTICLE","834368","INTERVIENT.DANS","W0422A,1,GAINAGE/50.001","W0422A,1,GAINAGE/50.001")
TEST4 X ^UTA
 W !,$$OVLIR("PERE.I","DUPONT","FISTON","JEAN","JULES")
 W !,$$OVLIR("FILS.I","DUPONT,JEAN","PAPA","DUPONT",1)
 Q


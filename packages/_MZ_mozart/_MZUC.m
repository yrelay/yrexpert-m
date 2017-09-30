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

;%MZUC^INT^1^59547,73872^0
MOZUC ;
 
OPER S REFUSE=1 F ROP="=","'=","<","'<",">","'>","[]","[[","]]","][","[","]","'[","']" I RESUL(IC)=ROP S REFUSE=0 G FIN
 S REFUSE=1 F ROP="#^'=",">=^'<","=>^'<","=<^'>","<=^'>" I RESUL(IC)=$P(ROP,"^",1) S REFUSE=0,ICC=IC,TAB(ICC)=$P(ROP,"^",2) D ^%VAFFICH G FIN
FIN Q
POP S %IT2=3 G NUDIM3
NUDIM3 S REFUSE=1,%RE="" F %IT=1:1:%IT2 G:'($D(RESUL(%IT))) FNUD G:RESUL(%IT)="" FNUD S %RE=%RE_$S(%RE="":"",1:",")_""""_RESUL(%IT)_""""
 I RESUL(IC)="SINON" S REFUSE=0 G FNUD
NUDIM4 S %TB=NOMTAB_"("_%RE_")",REFUSE=0 I '($D(@%TB)) S ICC=IC,TAB(IC)=1 D ^%VAFFICH G FNUD
 S (%ITR,%IT)=-1 F %ITT=1:1 S %IT=$N(@%TB@(%IT)) Q:%IT=-1  S %ITR=%IT
 S ICC=IC,TAB(IC)=$S(%ITR=-1:1,1:%ITR+1) D ^%VAFFICH
FNUD K %IT,TAB,%ITT,%ITR,%RE,%TB G FIN
REAFF S OIC=IC D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR S (ICC,IC)=OIC K OIC
 Q
EFF S DX=^%SCRE(SCR,IC,2),DY=^%SCRE(SCR,IC,3) X XY W ^%SCRE(SCR,ICC,1) F ZZ=1:1:LP W " "
 G FIN
TYPREL I RESUL(IC)="" S REFUSE=0 G FIN
 S REFUSE=1,TR=$S($D(^MOZ(WHOIS,"C","PARA")):^MOZ(WHOIS,"C","PARA"),1:^MOZ("STAND","C","PARA")),%PCH=RESUL(IC) D ^%QZNBN1 G:ISNUM RELNUM G:RESUL(IC)="?" HLPREL
 S PARA=RESUL(IC),LP=$L(PARA) D ^%QZCHBT
 F IT1=1:1 S P1=$P(TR,",",IT1) Q:P1=""  F IT2=IT1+1:1 S P2=$P(TR,",",IT2) Q:P2=""  S R=P1_"."_P2 I R=PARA S ICC=IC,TAB(IC)=PARA D EFF,^%VAFFICH S REFUSE=0 Q
 K PARA,P1,P2,IT1,IT2,R G FIN
RELNUM S NR=0 F IT1=1:1 S P1=$P(TR,",",IT1) Q:P1=""  F IT2=IT1+1:1 S P2=$P(TR,",",IT2) Q:P2=""  S R=P1_"."_P2,NR=NR+1 I NR=RESUL(IC) S ICC=IC,TAB(IC)=R D ^%VAFFICH S REFUSE=0 Q
 K NR,P1,P2,IT1,IT2,R G FIN
HLPREL D CLEPAG^%VVIDEO S MSG="Relations possibles",DX=40-($L(MSG)\2),DY=0 X XY D REV^%VVIDEO X XY W MSG D NORM^%VVIDEO
 S NR=0,DX=0,DY=1 F IT1=1:1 S P1=$P(TR,",",IT1) Q:P1=""  F IT2=IT1+1:1 S P2=$P(TR,",",IT2) Q:P2=""  S NR=NR+1,R=P1_"."_P2,DY=DY+1,RET="" S:DY=22 DX=DX+40,DY=2 D:NR>35 ALORS Q:(RET=1)!(RET=6)  X XY W $S(NR<10:" ",1:""),NR," ",$E(R,1,35)
 I (RET'=1)&(RET'=6) D POCLEPA^%VVIDEO W "[RETURN]" R *RET
 D REAFF K RET,P1,P2,IT1,IT2,R G FIN
ALORS D POCLEPA^%VVIDEO W "[RETURN] pour continuer,(CTRLA) pour abandonner " R *RET S DX=0,DY=2 D CLEBAS^%VVIDEO
DOM I RESUL(IC)="" S REFUSE=1 G FIN
 S REFUSE=1,TR=$S($D(^MOZ(WHOIS,"C","PARA")):^MOZ(WHOIS,"C","PARA"),1:^MOZ("STAND","C","PARA")) G:RESUL(IC)="?" HLPDOM S %PCH=RESUL(IC) D ^%QZNBN1 G:ISNUM DOMNUM
 F IT1=1:1 S P1=$P(TR,",",IT1) Q:P1=""  I P1=RESUL(IC) S REFUSE=0 Q
 G:REFUSE=0 FIN
 K P1,IT1 G FIN
DOMNUM S NR=0 F IT1=1:1 S P1=$P(TR,",",IT1) Q:P1=""  S NR=NR+1 I NR=RESUL(IC) S ICC=IC,TAB(IC)=P1 D ^%VAFFICH S REFUSE=0 Q
 K NR,P1,IT1 G FIN
HLPDOM D LISDOM(.LIST),INIT^%QUCHOIP("LIST","",1,27,16,20,6),AFF^%QUCHOIP
HLPDOM1 S TAB(ICC)=$$UN^%QUCHOIP G HLPDOM1:TAB(ICC)=""
 D END^%QUCHOIP,CLFEN^%VVIDEO(0,16,6,79) S REFUSE=1 D ^%VAFFICH S REFUSE=0 G FIN
ELDOM S P1=$P(RESUL(IC-1),".",1) G TED
ELDOM1 S P1=$P(RESUL(IC-2),".",2) G TED
TED I RESUL(IC)="" S REFUSE=1 G ACED
 I P1="MACHINE" S REFUSE=$S('($D(^[QUI]DESMACH(RESUL(IC)))):1,1:0) G FIN
 I P1="OUTIL" S REFUSE=$S('($D(^[QUI]DESOUT(RESUL(IC)))):1,1:0) G FIN
 S REFUSE=$S('($D(^[QUI]MOZITEM(P1,RESUL(IC)))):1,1:0) G:REFUSE=1 ACED K P1 G FIN
ACED D ^%VSQUEAK,POCLEPA^%VVIDEO W "(A)jouter des elem. a un domaine,(C)onsulter les elem. d'un domaines,[RETURN]" R *RET D POCLEPA^%VVIDEO G A:RET=65,C:RET=67,FIN
A D POCLEPA^%VVIDEO W "Un instant..." D ^%QCAMEMS,CLEPAG^%VVIDEO,^%VAJOUT("MOZITEM"),POCLEPA^%VVIDEO W "Un instant..." D ^%QCAMEMR,REAFF G FIN
C D ^%MZELDOB,REAFF G FIN
 
DOMAINE 
 I '($$AUTOR^%MZACVOC(WHOIS)) G NOACCES
 N LIST,TR,TR2,P1,IT1
 D CLEPAG^%VVIDEO,^%VZCDB("SUPPRESSION  DE  DOMAINE",0)
SUPDOM K LIST S TR=$S($D(^MOZ(WHOIS,"C","PARA")):^MOZ(WHOIS,"C","PARA"),1:^MOZ("STAND","C","PARA"))
 D LISDOM(.LIST)
 F P1="ACTION","MACHINE","OBJET","MANIERE","OUTIL" K LIST(P1)
 D INIT^%QUCHOIP("LIST","",1,25,6,20,12),AFF^%QUCHOIP S DOM=$$UN^%QUCHOIP
 Q:DOM=""
 F P1="ACTION","MACHINE","OBJET","MANIERE","OUTIL" S LIST(P1)=""
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI("Confirmez-vous la suppression ? ") S TR2=$P(TR,DOM,1)_$P(TR,DOM,2) S:$E(TR2,$L(TR2))="," TR2=$E(TR2,1,$L(TR2)-1) S ^MOZ("STAND","C","PARA")=$$ZSUBST^%QZCHSUB(TR2,",,",",") K ^[QUI]MOZITEM(DOM)
 D POCLEPA^%VVIDEO G SUPDOM
 
AJDOM 
 I '($$AUTOR^%MZACVOC(WHOIS)) G NOACCES
 N LST,Y1
 D CLEPAG^%VVIDEO,^%VZCDB("AJOUT   DE   DOMAINES",0),LISDOM(.LST)
AJ1 S DX=10,DY=6 X XY D BLD^%VVIDEO W "Nom du nouveau domaine : " S DX=$X D NORM^%VVIDEO,^%VLEC
 G FIN:Y1=""
 I Y1="?" D INIT^%QUCHOIP("LST","",1,30,7,20,14),AFF^%QUCHOIP,^%VZEAVT(""),END^%QUCHOIP,CLFEN^%VVIDEO(0,7,14,79),AFFBLK G AJ1
 I $D(LST(Y1)) D ^%VZEAVT("Ce domaine existe deja !!"),AFFBLK G AJ1
 D POCLEPA^%VVIDEO I $$MES^%VZEOUI("Confirmation ? ","O") S ^MOZ("STAND","C","PARA")=^MOZ("STAND","C","PARA")_","_Y1,LST(Y1)=""
 D AFFBLK G AJ1
LISDOM(LL) 
 N CH
 S CH=$S($D(^MOZ(WHOIS,"C","PARA")):^MOZ(WHOIS,"C","PARA"),1:^MOZ("STAND","C","PARA"))
 F IT1=1:1 S P1=$P(CH,",",IT1) Q:P1=""  S LL(P1)=""
 Q
AFFBLK 
 S DX=0,DY=6 X XY W $J(" ",79) Q
 
AJVOC 
 I '($$AUTOR^%MZACVOC(WHOIS)) G NOACCES
 D CLEPAG^%VVIDEO,^%VAJOUT("MOZITEM") Q
 
CMSVOC 
 I '($$AUTOR^%MZACVOC(WHOIS)) G NOACCES
 D CLEPAG^%VVIDEO,^%VCMS("MOZITEM") Q
 
NOACCES 
 D ^%VZEAVT($$^%QZCHW("acces non autorise")) Q


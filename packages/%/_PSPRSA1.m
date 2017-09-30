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

;%PSPRSA1^INT^1^59547,73874^0
%PSPRSA1(PRED,LIG,HAUT) ;;11:18 AM  28 Sep 1993; ; 28 Sep 93 10:41 AM
 
 
 
 
 
 
 
 N %PROVEN,C,I,LC,TABC,ROUTREAF,DEF
 
 N Y1,BUFCP,BUFFER,RESCOMP,EXT
 I '($$EXISTE^%TLQUER("p."_PRED)) D CREER^%TLQUER("p."_PRED)
 S DEF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DEF") K @(DEF)
 S @DEF@("PRED")=PRED
 S %PROVEN="GPS",LC=1,ROUTREAF="REAFC^%PSPRSA1"
 D REAFFI
 D ^%QULIMO(0,LIG,80,HAUT,"^[QUI]RQSGLO(""PRED"","""_PRED_""")",.LC,"ADDCOND2^%PSPRSA1(1)","SUPCOND^%PSPRSA1")
 S RESCOMP=$$COMPIL^%PSPRGES(PRED,0)
 D MAJ^%TLQUER2("^[QUI]RQSGLO(""PRED"","""_PRED_""")","p."_PRED,1,1,1)
 Q
 
REAFFI D CLFEN^%VVIDEO(0,LIG,HAUT,80),CADR
 D REAFF^%QULIMO3(1,1,"^[QUI]RQSGLO(""PRED"","""_PRED_""")",0,LIG,80,HAUT)
 Q
 
CADR D CARSP^%VVIDEO(0,LIG,HAUT,80,1)
 S DX=20,DY=LIG X XY W " "_$$^%QZCHW("Predicat")_" "_PRED
 Q
REAFC 
 N DEF,PRED
 S DEF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DEF"),PRED=@DEF@("PRED")
 D CLEPAG^%VVIDEO,CADR
 D REAFF^%QULIMO3(1,1,"^[QUI]RQSGLO(""PRED"","""_PRED_""")",0,LIG,80,HAUT)
 D A18^%QULIMO4
 D REAFF^%AN7
 Q
 
ADDCOND2(BOOL) 
 N RES
 S RES=$$ADDCOND(BOOL)
 Q
 
ADDCOND(BOOL) 
 
 
 
 
 N POSIT,RA,SAVY1,SX,SY,NOCOMPIL,ATTD,APPD,APPEX,%PROVEN
 N %COMPIL,%COMP1,%COMP2,%COMP3,%COMP4,%COMP5,CH,NORES,P,RESULT,TEMPO
 N DEF,PRED,%IC
 S DEF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DEF"),PRED=@DEF@("PRED")
 K ^SANAREQ($J) S NOCOMPIL=1
 S (ATTD,APPD,APPEX)=0,%PROVEN="GPS",%COMPIL=""
 S SAVY1=Y1,SX=DX,SY=DY,(POSIT,P)=1
 I '(BOOL) D INIT2^%AN7(SX,SY) G SUIT
 D INIT^%AN7(SX,SY)
 S RA=$$VAL^%QULIMO("TETE") I RA'="",$D(CTR),CTR'="D" D KILL^%ANA(RA)
 F %IC=1:1 Q:$$VAL^%QULIMO("ATTRIBUT."_%IC)=""  D DEL^%QULIMO("ATTRIBUT."_%IC)
 D AFF^%QULIMO("TETE",0)
SUIT D INIT^%ANGEPIL
 S CH=Y1,RESULT=1,NORES=0,TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AS")
 
 I $E(CH)=":" D AFF^%AN7(":") S %COMPIL=";" G SUIT2
 
 K @(TEMPO) D EMPV^%ANGEPIL(TEMPO),EMPIL^%ANGEPIL("SUIT0^%PSPRSA1")
 G COND^%AN4
SUIT0 D END^%AN7,EPIL^%ANGEPIL K @(TEMPO),^NAVARACT($J)
SUIT2 S OK=RESULT
 I '(OK) D ^%VSQUEAK G FINAC
 S RA=$$NEW^%ANA
 D SET^%ANA(RA,"TYPE","INFERENCE")
 D SET^%ANA(RA,1,NORES)
 S RA3=$$NEW^%ANA
 D SET^%ANA(RA3,"TYPE","NOM")
 D SET^%ANA(RA3,"TEXTE","%RESULTAT.LIGNE")
 S RA2=$$NEW^%ANA
 D SET^%ANA(RA2,"TYPE","ATTRIBUT")
 D SET^%ANA(RA2,1,RA3)
 D SET^%ANA(RA2,2,0)
 D SET^%ANA(RA2,3,0)
 S RA3=$$NEW^%ANA
 D SET^%ANA(RA3,"TYPE","ACTION")
 D SET^%ANA(RA3,"TEXTE","AFFECTATION")
 D SET^%ANA(RA3,1,RA2)
 S RA2=$$NEW^%ANA
 D SET^%ANA(RA2,"TYPE","NOMBRE")
 D SET^%ANA(RA2,"TEXTE",1)
 D SET^%ANA(RA3,2,RA2)
 D SET^%ANA(RA,2,RA3)
 D AFF^%QULIMO("TETE",RA)
 D AFF^%QULIMO("NBR.ATTRIBUTS",ATTD)
 F %IC=1:1:ATTD D AFF^%QULIMO("ATTRIBUT."_%IC,ATTD(%IC))
FINAC K ATTD S Y1=SAVY1,DX=SX,DY=SY
 Q RESULT
 
SUPCOND 
 N RA,DEF,PRED
 S DEF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DEF"),PRED=@DEF@("PRED")
 S RA=$$VAL^%QULIMO("COMP") D:RA'="" KILL^%ANA(RA)
 S OK=1 Q
 
 
 
AJCOMP(PHRACOMP) 
 N IPH
 S IPH=$ZP(^[QUI]RQSDON("PRED",PRED,""))+1
 S ^[QUI]RQSDON("PRED",PRED,IPH)=PHRACOMP
 Q IPH
 
KILLCOMP(IPH) 
 K ^[QUI]RQSDON("PRED",PRED,IPH)
 Q
 
 
ANAONE(PRED) 
 N P1C,Y1,LI,DEF,RES
 I '($$EXISTE^%TLQUER("p."_PRED)) D CREER^%TLQUER("p."_PRED)
 S RES=1
 S DEF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DEF") K @(DEF)
 S @DEF@("PRED")=PRED
 K ^[QUI]RQSDON("COMPPRED",PRED)
 S LI="^[QUI]RQSGLO(""PRED"","""_PRED_""")"
 F P1C=1:1 Q:'($D(@LI@(P1C)))  S Y1=@LI@(P1C) K ^[QUI]RQSGLO("PRED",PRED,P1C,"COMP") S RES=RES&$$ADDCOND^%PSPRSA1(0)
 D MAJ^%TLQUER2("^[QUI]RQSGLO(""PRED"","""_PRED_""")","p."_PRED,0,1,RES)
 Q RES
 ;


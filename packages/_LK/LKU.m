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

;LKU^INT^1^59547,74868^0
LKU(RGAMME,NGAMME,ROP,GOP,KILLG) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N I,NOP,NGAMMEI
 S NGAMMEI=$$NOMEX^%QSGES10(RGAMME,NGAMME)
 I KILLG D SX^%QSGESTI(RGAMME,NGAMME),PA^%QSGESTI(RGAMME,NGAMME,"NOM",NGAMMEI,1)
 S NOP=$O(@GOP@(""))
 F I=0:0 Q:NOP=""  D OP1(NOP,GOP) S NOP=$O(@GOP@(NOP))
 Q
OP1(NOP,GOP) 
 N NOM,NOM1,ATT,I,MSG,ER
 S NOM=$$VAL(GOP,NOP,"NOM",1)
 I NOM="" S NOM=$$VAL(GOP,NOP,"ACTION",1)_"/"_$$VAL(GOP,NOP,"NUMERO.OPERATION",1)_".001"
 S NOM1=$$NOMFILS^%QSGES10(RGAMME,NGAMME,ROP,NOM)
 S ER=$$CREER^%QSGEIND(ROP,NOM1,NOP_".001",1,.MSG)
 I ER W !,MSG Q
 S ATT=$O(@GOP@(NOP,""))
 F I=0:0 Q:ATT=""  D OP2 S ATT=$O(@GOP@(NOP,ATT))
 Q
OP2 W !,NOM1," ",ATT
 D MVS^%QSCALVA(ROP,NOM1,ATT,$$CONCAS^%QZCHAD(GOP,NOP_","_ATT))
 Q
VAL(GOP,NOP,ATT,OR) 
 I '($D(@GOP@(NOP,ATT,OR))) Q ""
 N %V S %V=@GOP@(NOP,ATT,OR) Q %V
 
TEST1 S GOP="GOP1"
 S @GOP@(1,"NOM",1)="OPERATION.1"
 S @GOP@(1,"ATT1",1)="VAL1"
 S @GOP@(1,"ATT1",2)="VAL2"
 D LKU("MOZ","TARZAN,GAMME","GAMME","MOZOP",GOP,1)
 Q
 
 
 
TRANS(TAB,VAL,GOP) 
 N NOP,I,O,ATT
 S NOP=$P(VAL,"^",@TAB@("CLE"))
 S O=$O(@TAB@("A",""))
 F I=0:0 Q:O=""  D TRANS1 S O=$O(@TAB@("A",O))
 Q
TRANS1 S ATT=@TAB@("A",O,"N")
 S @GOP@(NOP,ATT,1)=$P(VAL,"^",O)
 Q
TABLE ;;|"A",1,"N"|NUMERO.OPERATION|
 ;;|"A",2,"N"|ACTION|
 ;;|"A",3,"N"|OBJET|
 ;;|"A",4,"N"|TEMPS.FABRICATION|
 ;;|"A",5,"N"|COMMENTAIRE|
 ;;|"A",6,"N"|OUTIL|
 ;;|"CLE"|1|
 ;;
INIT(GLO,GOP) 
 N I,O,TABLE,T1
 S TABLE="T1"
 D ^%QCAGLTX("TABLE^LKU",TABLE)
 K @(GOP)
 S O=$O(@GLO@(""))
 F I=0:0 Q:O=""  D INIT1 S O=$O(@GLO@(O))
 Q
INIT1 S VAL=@GLO@(O)
 D TRANS(TABLE,VAL,GOP)
 W !,O," ",VAL
 Q
TEST2 W !,"RGAMME : " R RGAMME
 W !,"NGAMME : " R NGAMME
 W !,"ROP    : " R ROP
 N TEMP,GOP
 S TEMP=$$CONCAS^%QZCHAD("^TEMPORAI",$J_","_$P($ZPOS,"^",2)_",TEST2")
 S GOP=$$CONCAS^%QZCHAD(TEMP,"GOP")
 K @(TEMP)
 D INIT("^[QUI]PAM",GOP)
 D LKU(RGAMME,NGAMME,ROP,GOP,0)
 K @(TEMP)
 Q


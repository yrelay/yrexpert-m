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

;%SRSTOCK^INT^1^59547,73891^0
%SRSTOCK(SA,CHVAL,STO,ACTRT,TRT,GLERR,VAL,CCLE) 
 
 
 
 
 
 N LC,GLOERR,GLDK,OK,%INDI,%INDLI,CXT,OKT,OK,I,NOER,PREM,OKTOT
 K VAL
 S (OK,OKTOT,OKT,PREM)=1
 S MERR=""
 S LC=$L(CHVAL,$C(0))
 S GLDK=$$ADRC^%SRSTVAL(SA)
 S GLOERR=$$CONCAT^%QZCHAD(GLERR,""""_$$ZSUBST^%QZCHSUB(CCLE,"""","""""")_"""")
 S NOER=1
 F %I=1:1:LC S VAL(%I)=$P(CHVAL,$C(0),%I)
 
 X @GLDK@("IND","V")
 X @GLDK@("INDL","V")
 X @GLDK@("LIENS","V")
 X @GLDK@("ATTRI","V")
 G:'(ACTRT) STOCK
 
 S I=""
BIND S I=$O(%INDI(I))
 G:I="" BINDLI
 S CXT("%IND"_I,"OBJET")=%INDI(I)
 S CXT("%IND"_I,"BASE")=%INDI(I,"RI")
 G BIND
BINDLI S I=$O(%INDLI(I))
 G:I="" CHAMP
 S CXT("%INDLI"_I,"OBJET")=%INDLI(I)
 S CXT("%INDLI"_I,"BASE")=$$ONE^%QSGEL3("LIEN")
 G BINDLI
 
CHAMP D SXSPEED^%QSGESTK("%",$J)
BCHAMP S I=$O(VAL(I))
 G:I="" ACTRT
 D PA^%QSGESTI("%",$J,"%CHAMP"_I,VAL(I),1)
 G BCHAMP
 
ACTRT 
 N LISTE,OBJ,BASE,EXIS,IOBJ,RESACT
 K ^SAVVAL($J),^V($J)
 D PA^%QSGESTI("%",$J,"%OK",0,1)
 S IOBJ=$O(%INDI(""))
 S REP=%INDI(IOBJ,"RI"),OBJ=%INDI(IOBJ)
 S EXIS=$$IR^%QSGE5(REP,OBJ)
 I '(EXIS) D PA^%QSGESTI(REP,OBJ,"NOM",OBJ,1)
 S LISTE=$$GEN^%QCAPOP("SRA")
 D ^%QSGES11(REP,LISTE,"SRA",0,TRT,"")
 D STOCK^%QSGES11(LISTE,OBJ)
 S RESACT=$S($$EXISTE^%TLINTER(TRT):$$CONTEXTL^%TLIACTI(TRT,LISTE,0,1,0,.CXT,.ABANDON),1:0)
 I '(EXIS) D SX^%QSGESTK(REP,OBJ)
 D DEL^%QSGES11(LISTE)
 I RESACT'=0 D ADDER($$^%QZCHW("Probleme lors de l'activation du traitement")) Q 0
 S OKT=$$^%QSCALVA("%",$J,"%OK")+0
 D SX^%QSGESTK("%",$J)
 K ^SAVVAL($J),^V($J)
 I '(OKT) D ADDER($$^%QZCHW("Traitement")_", %OK=0") Q 0
 K CXT
 
STOCK 
 I '(OKTOT&OKT) Q 0
 S OK=1
 X @GLDK@("IND","C")
 Q:'(OK) 0
 X @GLDK@("INDL","C")
 Q:'(OK) 0
 X @GLDK@("LIENS","C")
 Q:'(OK) 0
 X @GLDK@("ATTRI","C")
 Q 1
 
ADDER(MES) 
 S @GLOERR@($J(NOER,4))=MES
 S NOER=NOER+1
 Q
 
CONTAT(REPI,ATT,M) 
 Q:((REPI="")!ATT)="" 1
 I ATT="NOM" S M=$$^%QZCHW("Interdit de modifier attr. NOM") Q 0
 I $$TYPE^%QSGEST9(REPI,ATT)'=0 S M=ATT_" "_$$^%QZCHW("interdit de modifier un lien") Q 0
 Q 1
 
ADDIND(R,I) 
 S @GLIND@(R,I)=""
 Q
 Q


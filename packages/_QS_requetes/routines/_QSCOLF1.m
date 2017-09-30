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

;%QSCOLF1^INT^1^59547,73880^0
QSCOLF2 ;
 
 
 
 
 
 
 
SUP 
 
 
 
 
 
 N VAL
 S SUP=0,EXI=@DONNE@(PL,PC)
 S ORD=$S(PC=2:1,EXI'["(":1,1:$P($P(EXI,"(",2),")",1))
 S OLD=$S(PC=2:EXI,1:$P(EXI," (",1))
 S ATT=$P(@DONNE@(PL,1)," (",1)
 S OR=$P($P(@DONNE@(PL,1)," (",2),")",1)
 S VAL=$S($D(@DONNE@(PL,2))#10:@DONNE@(PL,2),1:"")
 S REXT=$$ROUTMAJ^%QSGESPE(REP,ATT)
 I REXT'="" S:OR="" OR=1 D EXE^%QSCOLF2("S",ATT,VAL,OR,REXT) G FIN
 I '($$^%QSDROIT(REP,$P(@DONNE@(PL,1)," (",1),"T",WHOIS)) D COL^%VZEAVT($$^%QZCHW("vous n'avez pas le droit de supprimer")_" "_$S(PC=2:$$^%QZCHW("la valeur de "),1:"")_$$^%QZCHW("cet attribut "),XG,79) Q
 I PC=1 G DD
 
 S SUP=2,EXI=@DONNE@(PL,1),OLD=$P(EXI," (",1)
 S ORD=$S(EXI["(":$P($P(EXI,"(",2),")",1),1:1)
 S @DONNE@(PL,PC)=""
 D NET^%QSCOLF3,FULL^%QSCOLF
 G FIN
DD 
 D MES^%QSCOLF3("")
 G:$$CONFIRM^%VZEOUI($$^%QZCHW("suppression de")_" "_OLD_" ? : ")'=1 FIN
 D MES^%QSCOLF3("Ok ...")
 D SUP^%QSCOLF3(OLD,ORD,"",1,PL)
 G FIN
 
FIN 
 D MES^%QSCOLF3("")
 S @DONNE=$ZP(@DONNE@("")) Q
 
 
LEXIQ 
 N PCH,PCHCOMP,CONCUR
 I PC=2 S ATT=NEW Q
 S PCH=NEW D ^%LXABR
 I CONCUR=1 S ATT=PCHCOMP Q
 I CONCUR>1 D COL^%VZEAVT($$^%QZCHW("ambigu au lexique"),XG,79) G LEX
 D COL^%VZEAVT($$^%QZCHW("inconnu au lexique"),XG,79)
LEX D LEXIQ^%LXSTOCK(ROUTAFF)
 S PCH=NEW D ^%LXABR I CONCUR=0 S INS=0 Q
 I CONCUR>1 S INS=0 Q
 G LEXIQ


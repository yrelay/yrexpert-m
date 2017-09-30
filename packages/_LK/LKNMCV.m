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

;LKNMCV^INT^1^59547,74867^0
LKNMCV(TYPE,GR,REC,STRUCT) 
 
 
 
 
 
 
 
 
 
 
 
 
 N I,REP,MSG
 S MSG=""
 S REP=$O(@GR(6)@(REC,""))
 F I=0:0 Q:REP=""  Q:MSG'=""  S MSG=$$REPCV(TYPE,.GR,REC,REP,STRUCT),REP=$O(@GR(6)@(REC,REP))
 Q MSG
 
 
 
 
 
 
 
 
REPCV(TYPE,GR,REC,REP,STRUCT) 
 N VAL,LE,SEP,BASE,I,ATT,LIEN,LA
 I ($D(@GR(6)@(REC,REP))#10)=0 Q ""
 S VAL=@GR(6)@(REC,REP)
 S LE=$P(VAL,"^",$$POS^LKMZ(TYPE,6,"LE"))
 
 S SEP=$P(VAL,"^",$$POS^LKMZ(TYPE,6,"SEP"))
 
 S LA=$P(VAL,"^",$$POS^LKMZ(TYPE,6,"LA"))
 I '($$ENTP^%QZNBN(LE)) Q LE_" "_$$^%QZCHW("la longueur de l'enregistrement du repertoire")_" "_REP_" "_$$^%QZCHW("doit etre un entier")
 S BASE=$$NOMINT^%QSF(REP)
 I BASE="" Q REP_" "_$$^%QZCHW("n'est pas un repertoire")
 S @STRUCT@("S",BASE,"L")=LE
 S @STRUCT@("S",BASE,"S")=SEP
 
 I TYPE="XEC" S MSG=$$NM^LKMMVER(TYPE,.GR,REC,REP,$$CONCAS^%QZCHAD(STRUCT,"S,"_BASE))
 I TYPE="XPV" S @STRUCT@("S",BASE,"D",1,"T")=LA-1,@STRUCT@("S",BASE,"D",LA,"T")=LE-LA
 
 S LIEN=$O(@GR(5)@(REC,REP,""))
 F I=0:0 Q:LIEN=""  S @STRUCT@("S",BASE,"R",LIEN)="",LIEN=$O(@GR(5)@(REC,REP,LIEN))
 Q MSG


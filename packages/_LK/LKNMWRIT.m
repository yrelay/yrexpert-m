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

;LKNMWRIT^INT^1^59547,74867^0
LKNMWRIT(GUY,BASE,IND,DATA,BLK,DATE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N ATT,I,VAL,TYPE,J,OR,ERR,ATTI,VA,BLKI,BASEF,NOMF
 S BLKI=$ZP(@BLK@(BASE,DATE,"DATA",1,""))+1
 
 I GUY="XPV" D PV
 I GUY="XEC" D EC
 
 S ATT=$O(@DATA@(BASE,"R",""))
 F I=0:0 Q:ATT=""  D T2 S ATT=$O(@DATA@(BASE,"R",ATT))
 Q
EC S ATTI=$O(@DATA@(BASE,"D",""))
 F I=0:0 Q:ATTI=""  D T1 S ATTI=$O(@DATA@(BASE,"D",ATTI))
 S @BLK@(BASE,DATE,"DATA",1,BLKI)=$$^%QZCHFO($$CONCAS^%QZCHAD(DATA,BASE),.ERR),BLKI=BLKI+1
 Q
PV N LATT,REP,N
 S N=$O(@DATA@(BASE,"D",1)) I N="" Q
 
 S LATT=$$LK3^LKMZ(GUY)
 S REP=$$NOMLOG^%QSF(BASE)
 I (REP="")!(LATT="") Q
 
 S ATT="NOM" D PV1
 S ATT=$O(@LATT@(REC,BASE,""))
 F I=0:0 Q:ATT=""  D:ATT'="NOM" PV1 S ATT=$O(@LATT@(REC,BASE,ATT))
 Q
PV1 S @DATA@(BASE,"D",1,"D")=ATT
 S @DATA@(BASE,"D",N,"D")=$$^%QSCALVA(BASE,IND,ATT)
 S @BLK@(BASE,DATE,"DATA",1,BLKI)=$$^%QZCHFO($$CONCAS^%QZCHAD(DATA,BASE),.ERR),BLKI=BLKI+1
 Q
T1 
 I '($D(@DATA@(BASE,"D",ATTI,"ATT"))) Q
 S ATT=@DATA@(BASE,"D",ATTI,"ATT")
 D MV^%QSCALVA(BASE,IND,ATT,.VAL,.TYPE)
 I VAL=0 S @DATA@(BASE,"D",ATTI,"D")="" Q
 S VA=$O(VAL("")),@DATA@(BASE,"D",ATTI,"D")=$$S^%QAX(VAL(VA))
 
 Q
T2 D MV^%QSCALVA(BASE,IND,ATT,.VAL,.TYPE)
 I VAL=0 Q
 I TYPE=0 Q
 I TYPE=1 D T5P Q
 I TYPE=2 D T5F Q
 I TYPE=3 D T5R Q
 Q
T5P S OR=$O(VAL(""))
 F J=0:0 Q:OR=""  D T4P S OR=$O(VAL(OR))
 Q
T5F S OR=$O(VAL(""))
 F J=0:0 Q:OR=""  D T4F S OR=$O(VAL(OR))
 Q
T5R S OR=$O(VAL(""))
 F J=0:0 Q:OR=""  D T4R S OR=$O(VAL(OR))
 Q
T4P N REPD
 S REPD=$$REPD^%QSGEL2(BASE,ATT)
 D PUSH^%QCASTA(PILE,VAL(OR)_"^"_REPD)
 Q
T4F N REPD
 S REPD=$$REPD^%QSGEL2(BASE,ATT)
 D PUSH^%QCASTA(PILE,$$NOMFILS^%QSGES10(BASE,IND,REPD,VAL(OR))_"^"_REPD)
 Q
T4R N REPD
 S REPD=$$REPD^%QSGEL2(BASE,ATT)
 D PUSH^%QCASTA(PILE,VAL(OR)_"^"_REPD)
 Q
 ;


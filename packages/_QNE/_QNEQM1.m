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

;%QNEQM1^INT^1^59547,73879^0
QNEQM1 ;
 
 
 
 
 
 
 
 
CRETYPV(R,SOURCE,AUTRE,TYP) 
 N FREELIST,L,I,VISU
 S VISU=1
 S FREELIST=$$FREE
 
 S L=$O(@FREELIST@("B",""))
 F I=0:0 Q:L=""  Q:$$EX^%QSGEST7(L)  D KILL(FREELIST,L) S L=$O(@FREELIST@("B",L))
 
 I L="" Q $$NEWL(FREELIST,R,SOURCE,AUTRE,TYP)
 I VISU W !,"on alloue ",L
 K @FREELIST@("B",L) S @FREELIST@("A",L)="",@FREELIST@("B")=@FREELIST@("B")-1,@FREELIST@("A")=@FREELIST@("A")+1
 I $$BASE^%QSGEST7(L)'=R D ADDA^%QS0(L,"BASE",R)
 I $$TYP^%QSGEST7(L)'=TYP D ADDA^%QS0(L,"TYPE.OBJET",TYP)
 Q L
 
 
NEWL(FREELIST,R,SOURCE,AUTRE,TYP) 
 N L,ADR,TRI
 S TL="TMP"
 S L=$$NOM^%QSGES11(TL)
 S ADR=$$STO^%QSGES11(L)
 S TRI=$$STOTRI^%QSGES11
 D CRETYP^%QSGES11(R,L,TL,0,SOURCE,ADR,AUTRE,TYP,TRI)
 S @FREELIST@("A",L)=""
 S @FREELIST@("A")=@FREELIST@("A")+1
 Q L
 
DEL(L) 
 N FREELIST
 S FREELIST=$$FREE
 I $D(@FREELIST@("A",L)) K @FREELIST@("A",L) S @FREELIST@("A")=@FREELIST@("A")-1
 S @FREELIST@("B",L)=""
 S @FREELIST@("B")=@FREELIST@("B")+1
 Q
 
 
DELN(N) 
 N FREELIST
 S FREELIST=$$FREE
 N S
 S S=@FREELIST@("A")+@FREELIST@("B")
 I S<N Q
 N I,L
 S L=$O(@FREELIST@("B",""))
 F I=1:1:S-N Q:L=""  D KILL(FREELIST,L) S L=$O(@FREELIST@("B",L))
 Q
 
KILL(FREELIST,L) 
 I $D(@FREELIST@("A",L)) K @FREELIST@("A",L) S @FREELIST@("A")=@FREELIST@("A")-1
 I $D(@FREELIST@("B",L)) K @FREELIST@("B",L) S @FREELIST@("B")=@FREELIST@("B")-1
 I $$EX^%QSGEST7(L) D DEL^%QSGES11(L)
 Q
FREE() Q "^["""_QUI_"""]RQSGLO(""QMFREEL"")"
 
INIT N FREELIST
 S FREELIST=$$FREE
 S @FREELIST@("A")=$$CARD^%QCALIST($$CONCAS^%QZCHAD(FREELIST,"A"))
 S @FREELIST@("B")=$$CARD^%QCALIST($$CONCAS^%QZCHAD(FREELIST,"B"))
 Q
 
ZERO N FREELIST,L,I
 S FREELIST=$$FREE
 S L=$O(@FREELIST@("A",""))
 F I=0:0 Q:L=""  D DEL(L) S L=$O(@FREELIST@("A",L))
 Q


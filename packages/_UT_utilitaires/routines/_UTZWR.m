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
;! Nomprog     : %UTZWR                                                       !
;! Module      : %UT (Utilitaire)                                             !
;! But         : Sauvegarde des globals au format ZWR pour GTM                !
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

;%ZUTZWR^INT^1^59547,73863^0
ZUTZWR ;;02:51 PM  30 Apr 1990; 25 Sep 89  3:00 PM ; 30 Mar 93 10:59 AM

ZWR ;Sauvegarder des globals au format ZWR

 W !!,"SAUVEGARDE DES GLOBALS AU FORMAT ZWR",!!
 ;;D OUT^%IS Q:$G(IO)=""  ;request output dev
 R !!,"File ? ",IO,! S IO="fichier.zwr" S IO=$I
 d GD^%GSEL Q:$G(%ZG)<1    ;Acquérir les globals à sauvegarder

 OPEN IO:newversion

ASK R !!,"Commentaire ? ",COM,! I COM?1"?".E D  G ASK
 . W "Entrer un commentaire à sauvegarder avec le fichier. ",!
 S H=$H,LF=$C(10),QT="""",C255=$C(255)
 U IO:width=132
 W COM,!
 W "Yexpert "_$ZD($H,"DD/MM/YEAR")_" "_$ZD($H,"24:60:SS")_" ZWR",!
 S GN="" F  S GN=$O(%ZG(GN)) Q:GN=""  D
 . D WALK(GN)
 C IO U $P
 W !,"Fini.",!
 Q
 ;
WALK(G) ;walk through global G, convert subscripts and values as necessary, dump out
 Q:'$D(@G)  Q:G["("    ; chk if @G defined, and must be a top-level name
 I $D(@G)#2 D          ; handle case where top-level node has data
 . S NAME=$NA(@G)
 . S VAL=$$CGV(@G)
 . W NAME_"="_VAL,!
 F  S G=$Q(@G) Q:G=""  D   ;handle rest of global G
 . S NAME=$NA(@G)
 . S NAME=$$RCC(NAME) D
 . . N P                      ;Remove initial ""_ or final _""
 . . S P=$F(NAME,"(") I P,$E(NAME,P,P+2)="""""_" S $E(NAME,P,P+2)=""
 . . S P=$L(NAME) S:$E(NAME,P-3,P-1)="_""""" $E(NAME,P-3,P-1)=""
 . S VAL=$$CGV(@G)
 . W NAME_"="_VAL,!
 Q
 ;
RCC(NA) ;Replace control chars in NA with $C( ). Returns encoded string.
 Q:'$$CCC(NA) NA                         ;No embedded ctrl chars
 N OUT S OUT=""                          ;holds output name
 N CC S CC=0                             ;count ctrl chars in $C(
 N C                                     ;temp hold each char
 F I=1:1:$L(NA) S C=$E(NA,I) D           ;for each char C in NA
 . I C'?1C,C'=C255 D  S OUT=OUT_C Q      ;not a ctrl char
 . . I CC S OUT=OUT_")_""",CC=0          ;close up $C(... if one is open
 . I CC D
 . . I CC=256 S OUT=OUT_")_$C("_$A(C),CC=0  ;max args in one $C(
 . . E  S OUT=OUT_","_$A(C)              ;add next ctrl char to $C(
 . E  S OUT=OUT_"""_$C("_$A(C)
 . S CC=CC+1
 . Q
 Q OUT
 ;
CGV(V) ;Convert Global Value.
         ;If no encoding required, then return as quoted string.
         ;Otherwise, return as an expression with $C()'s and strings.
 I $F(V,QT) D     ;chk if V contains any Quotes
 . S P=0          ;position pointer into V
 . F  S P=$F(V,QT,P) Q:'P  D  ;find next "
 . . S $E(V,P-1)=QT_QT        ;double each "
 . . S P=P+1                  ;skip over new "
 I $$CCC(V) D  Q V
 . S V=$$RCC(QT_V_QT)
 . S:$E(V,1,3)="""""_" $E(V,1,3)=""
 . S L=$L(V) S:$E(V,L-2,L)="_""""" $E(V,L-2,L)=""
 Q QT_V_QT
 ;
CCC(S) ;test if S Contains a Control Character or $C(255).
 Q:S?.E1C.E 1
 Q:$F(S,$C(255)) 1
 Q 0



